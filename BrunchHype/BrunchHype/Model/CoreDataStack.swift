//
//  CoreDataStack.swift
//  BrunchHype
//
//  Created by Moses on 4/23/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

import Foundation

class CoreDataStack {
    
    static let container: NSPersistentContainer = {
        
        // appName captures the name of the project for use in the computed property 'container'
        let appName = Bundle.main.object(forInforDictionaryKey: ( kCFBundleNameKey as String)) as! String
        let container = NSPersistentContainer(name: appName)
    container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    static var context: NSManagedObjectContext { return container.viewContext }
}
