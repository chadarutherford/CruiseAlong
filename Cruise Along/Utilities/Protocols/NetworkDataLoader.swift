//
//  NetworkDataLoader.swift
//  Cruise Along
//
//  Created by Chad Rutherford on 3/2/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

import Foundation

protocol NetworkDataLoader {
    func loadData(using request: URLRequest, completion: @escaping (Data?, HTTPURLResponse?, Error?) -> Void)
    func loadData(using url: URL, completion: @escaping (Data?, HTTPURLResponse?, Error?) -> Void)
}
