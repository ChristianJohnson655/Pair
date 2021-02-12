//
//  CoreDataStack.swift
//  Pair
//
//  Created by Christian Johnson on 2/12/21.
//

import CoreData

enum CoreDataStack {
    
    static let container: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Pair")
        container.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Error loading persistence stores \(error)")
            } // end of if let error
        } // end of container.loadPersistentStores
        return container
    }() // end of static let container: NSPersistenContainer
    static var context: NSManagedObjectContext { container.viewContext }
    static func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Error saving context \(error)")
            } // end of catch
        } // end of if context.hasChanges
    } // end of static func saveContext
} // End of enum
