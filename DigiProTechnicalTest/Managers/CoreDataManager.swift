//
//  CoreDataManager.swift
//  DigiProTechnicalTest
//
//  Created by Américo MQ on 28/03/23.
//

import Foundation
import CoreData
import SwiftUI

class CoreDataManager: ObservableObject {
    let container: NSPersistentContainer
    @Published var savedEntities: [User] = []
    
    init() {
        container = NSPersistentContainer(name: "InfoContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading Core data. \(error)")
            } else {
                print("Succesfully loaded Coredata")
            }
        }
        fetchUsersinfo()
    }
    
    func fetchUsersinfo() {
        let request = NSFetchRequest<User>(entityName: "User")
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error Fetching \(error)")
        }
    }
    
    func saveUserInfo(name: String, firstLastName: String, secondLastName: String, email: String, phone: Int64) {
        let newInfo = User(context: container.viewContext)
        newInfo.name = name
        newInfo.firstLastName = firstLastName
        newInfo.secondLastName = secondLastName
        newInfo.mail = email
        newInfo.number = phone
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error saving data. \(error)")
        }
    }
}
