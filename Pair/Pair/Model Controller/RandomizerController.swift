//
//  RandomizerController.swift
//  Pair
//
//  Created by Christian Johnson on 2/12/21.
//

import CoreData


class PairController {
    
    static let shared = PairController()
    
    var persons: [Person] = []
    
    private lazy var fetchRequest: NSFetchRequest<Person> = {
        let request = NSFetchRequest<Person>(entityName: "Show")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    // MARK: - Functions
    func createNewPerson(newName: String) {
        let newPerson = Person(name: newName)
        persons.append(newPerson)
        CoreDataStack.saveContext()
        
    } // end of createNewPerson Function
    
    func fetchPerson() {
        persons = (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
    } // end of fetchPerson
    
    func updatePerson(person: Person, name: String) {
        person.name = name
        CoreDataStack.saveContext()
    } // end of updatePerson Function

    func deletePerson(person: Person) {
        CoreDataStack.context.delete(person)
        CoreDataStack.saveContext()
    } // end of deletePerson Function
    
    
    
    
    
    
} // end of PairController
