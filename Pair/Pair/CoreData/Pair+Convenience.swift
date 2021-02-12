//
//  Pair+Convenience.swift
//  Pair
//
//  Created by Christian Johnson on 2/12/21.
//

import CoreData

extension Person {
    
    @discardableResult
    convenience init(name: String, context: NSManagedObjectContext = CoreDataStack.context) {
        
        self.init(context: context)
        self.name = name
        
    } // end of convenience init
    
} // end of Pair Class
