//
//  CoreDataManager.swift
//  DigiProTechnicalTest
//
//  Created by Américo MQ on 28/03/23.
//

import Foundation
import CoreData
import SwiftUI

class CoreDataManager {
    let container: NSPersistentContainer
    static let shared = CoreDataManager()
    
    private init() {
        container = NSPersistentContainer(name: "InfoContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading Core data. \(error)")
            } else {
                print("Succesfully loaded Coredata")
            }
        }
    }
    
    func fetchUsersinfo() -> [User] {
        let request: NSFetchRequest<User> = User.fetchRequest()
        do {
            return try container.viewContext.fetch(request)
        } catch {
            return []
        }
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error saving data. \(error)")
        }
    }
}
