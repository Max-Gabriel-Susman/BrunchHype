//
//  BrunchSpotController.swift
//  BrunchHype
//
//  Created by Moses on 4/23/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

import Foundation
import CoreData

class BrunchSpotController {
    
    // MARK: - Properties
    
    // MARK: - Fetcheru
    let fetchedResultsController: NSFetchedResultsController<BrunchSpot>
    
    init() {
        
        let request: NSFetchRequest<BrunchSpot> = BrunchSpot.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "tier", ascending: true), NSSortDescriptor(key: "name", ascending: true)]
        
        // tier is sectionNameKeyPath because it determines what section brunchSpots go to
        let resultsController: NSFetchedResultsController<BrunchSpot> = NSFetchedResultsController(fetchRequest: request, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: "tier", cacheName: nil)
        
        fetchedResultsController = resultsController
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print("There was an error performing the fetch \(error.localizedDescription)")
        }
        
    }
    
    // MARK: - Singleton
    static let shared = BrunchSpotController()
    
    // MARK: - CRUD
    
    // Create , parameter name = name, internal parameter name = brunchSpotWith
    func create(brunchSpotWith name: String) {
        let idk = BrunchSpot(name: name)
        // save
        saveToPersistentStore()
    }
    
    // Update
    // context = singleton?
    func update(brunchSpot: BrunchSpot, name: String, tier: String, summary: String) {
        brunchSpot.name = name
        brunchSpot.tier = tier
        brunchSpot.summary = summary
        
        saveToPersistentStore()
    }
    
    // Delete
    func remove(brunchSpot: BrunchSpot) {
        CoreDataStack.context.delete(brunchSpot)
    }
    
    // Save
    func saveToPersistentStore() {
        do {
            try CoreDataStack.context.save()
        } catch {
            // error comes from the try statement
            print("Error saving managed object context, item not saved \(error.localizedDescription)")
        }
    }
    
} // END OF CLASS
