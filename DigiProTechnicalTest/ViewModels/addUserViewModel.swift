//
//  addUserViewModel.swift
//  DigiProTechnicalTest
//
//  Created by Américo MQ on 29/03/23.
//

import Foundation

class addUserViewModel {
    
    func saveUserInfo(name: String, firstLastName: String, secondLastName: String, email: String, phone: String) {
        let manager = CoreDataManager.shared
        let userInfo = User(context: manager.container.viewContext)
        userInfo.name = name
        userInfo.firstLastName = firstLastName
        userInfo.secondLastName = secondLastName
        userInfo.mail = email
        userInfo.number = Int64(phone)!
        
        manager.saveData()
    }
}
