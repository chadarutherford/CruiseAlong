//
//  CoreDataCloudKitStack.swift
//  Cruise Along
//
//  Created by Chad Rutherford on 3/2/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

import CloudKit
import CoreData
import Foundation

class CoreDataCloudKitStack {
    /// Sets up Singleton Instance
    static let shared = CoreDataCloudKitStack()
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Initialization
    private init() { }
    
    lazy var container: NSPersistentCloudKitContainer = {
        let container = NSPersistentCloudKitContainer(name: "CruiseAlong")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Failed to load persistent stores: \(error)")
            }
            container.viewContext.automaticallyMergesChangesFromParent = true
        }
        return container
    }()
    
    var mainContext: NSManagedObjectContext {
        container.viewContext
    }
    
    var backgroundContext: NSManagedObjectContext {
        container.newBackgroundContext()
    }
    
    func save(context: NSManagedObjectContext = CoreDataCloudKitStack.shared.mainContext) throws {
        var error: Error?
        
        context.performAndWait {
            do {
                try context.save()
            } catch let saveError as NSError {
                error = saveError
            }
        }
        if let error = error { throw error }
    }
}
