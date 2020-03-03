//
//  LoginViewController.swift
//  Cruise Along
//
//  Created by Chad Rutherford on 3/3/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

import AuthenticationServices
import SwiftUI
import UIKit

class LoginViewController: UIViewController {
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: Images.background)
        return imageView
    }()
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome to Cruise Along!"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .black
        return label
    }()
    
    let signInButton: SignInWithAppleButton = {
        let siwaButton = SignInWithAppleButton(authorizationButtonType: .signIn, authorizationButtonStyle: .black)
        return siwaButton
    }()
    
    var user: ASAuthorizationAppleIDCredential?
    weak var delegate: OnboardingFlowDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        addObserverForAppleIDChangeNotification()
        performExistingAccountSetupFlows()
    }
    
    private func addObserverForAppleIDChangeNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(appleIDStatusChanged), name: ASAuthorizationAppleIDProvider.credentialRevokedNotification, object: nil)
    }
    
    private func performExistingAccountSetupFlows() {
        let requests = [
            ASAuthorizationAppleIDProvider().createRequest(),
            ASAuthorizationPasswordProvider().createRequest()]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: requests)
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
    private func configureUI() {
        view.addSubview(backgroundImageView)
        view.addSubview(welcomeLabel)
        view.addSubview(signInButton)
        signInButton.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        NSLayoutConstraint.activate([
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            
            signInButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.widthAnchor.constraint(equalToConstant: 160),
            signInButton.heightAnchor.constraint(equalTo: signInButton.widthAnchor, multiplier: 0.25)
        ])
    }
    
    @objc func appleIDStatusChanged() {
        let provider = ASAuthorizationAppleIDProvider()
        guard let user = user else { return }
        provider.getCredentialState(forUserID: user.user) { [weak self] state, error in
            guard let self = self else { return }
            switch state {
            case .authorized:
                self.signInTapped()
            case .revoked:
                self.logout()
            case .notFound:
                self.logout()
            default:
                break
            }
        }
    }
    
    @objc func signInTapped() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
    private func logout() {
        
    }
    
    func signIn(with name: String) {
        delegate?.didLogIn(with: name)
    }
}

extension LoginViewController: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        self.view.window!
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let credential as ASAuthorizationAppleIDCredential:
            if let firstName = credential.fullName?.givenName, let lastName = credential.fullName?.familyName {
                let name = "\(firstName) \(lastName)"
                signIn(with: name)
            }
            UserDefaults.standard.set(credential.user, forKey: UserDefaultsKeys.userIdKey)
        default:
            break
        }
    }
}

struct LoginPreview: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func updateUIViewController(_ uiViewController: LoginPreview.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<LoginPreview.ContainerView>) {
            
        }
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<LoginPreview.ContainerView>) -> UIViewController {
            return LoginViewController()
        }
    }
}
