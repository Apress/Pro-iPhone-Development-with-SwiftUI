//
//  CoreDataManager.swift
//  CoreDataUI
//
//  Created by Wallace Wang on 10/9/21.
//

import Foundation
import CoreData

class CoreDataManager {
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "DataModel")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Core Data failed to initialize \(error.localizedDescription)")
            }
        }
    }
    
    func deletePet(animal: Animal) {
        persistentContainer.viewContext.delete(animal)
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to save context \(error.localizedDescription)")
        }
    }
    
    func getAllPets() -> [Animal] {
        
        let fetchRequest: NSFetchRequest<Animal> = Animal.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    func savePet(name: String, breed: String) {
        
        let pet = Animal(context: persistentContainer.viewContext)
        pet.name = name
        pet.breed = breed
        
        do {
            try persistentContainer.viewContext.save()
            print("Pet saved!")
        } catch {
            print("Failed to save movie \(error)")
        }
    }
}
