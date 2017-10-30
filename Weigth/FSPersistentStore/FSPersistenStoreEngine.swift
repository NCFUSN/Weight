//
//  FSPersistenStoreEngine.swift
//  Weigth
//
//  Created by Nathan Furman on 6/27/17.
//  Copyright © 2017 NCFUSN. All rights reserved.
//

import UIKit
import CoreData

enum FSCDEntity: String {
    
    case editor = "FSCDRecord"
}

protocol FSPersistentStoreDelegate: class {
    
    func persistentStoreDidFail(error: NSError)
    func persistentStoreDidPersist()
    func persistentStoreDidDelete()
}

internal class FSPersistentStoreEngine: NSObject {
    
    weak var delegate: FSPersistentStoreDelegate?
    
    override init() {
        super.init()
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "FSModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error {
                
                self.delegate?.persistentStoreDidFail(error: error as NSError)
            }
        })
        return container
    }()
    
    func saveAction(_ sender: AnyObject?) {
        // Performs the save action for the application, which is to send the save: message to the application's managed object context. Any encountered errors are presented to the user.
        let context = persistentContainer.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
                self.delegate?.persistentStoreDidPersist()
                
            } catch {
                // Customize this code block to include application-specific recovery steps.
                let nserror = error as NSError
                self.delegate?.persistentStoreDidFail(error: nserror)
            }
        }
    }
}
