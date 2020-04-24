//
//  BrunchSpot+Convenience.swift
//  BrunchHype
//
//  Created by Moses on 4/23/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

import Foundation
import CoreData

extension BrunchSpot {
    
    // optionality from data model inspector is overriden by these paramsB
    @discardableResult
    convenience init(name: String, tier: String = "Unrated", summary: String = "No summary added", context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.name = name
        self.tier = tier
        self.summary = summary
    }
}
