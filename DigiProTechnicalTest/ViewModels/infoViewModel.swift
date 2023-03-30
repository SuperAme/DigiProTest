//
//  infoViewModel.swift
//  DigiProTechnicalTest
//
//  Created by Américo MQ on 29/03/23.
//

import Foundation
import CoreData

class infoListViewModel: ObservableObject {
    @Published var userInfo = [infoViewModel]()
    
    func getInfo() {
        let info = CoreDataManager.shared.fetchUsersinfo()
        DispatchQueue.main.async {
            self.userInfo = info.map(infoViewModel.init)
        }
    }
}

struct infoViewModel {
    let user: User
    
    var id: NSManagedObjectID {
        return user.objectID
    }
    
    var name: String {
        return user.name ?? ""
    }
    
    var lastname: String {
        return user.firstLastName ?? ""
    }
    
    var secondLastname: String {
        return user.secondLastName ?? ""
    }
    
    var mail: String {
        return user.mail ?? ""
    }
    
    var phone: String {
        return String(user.number)
    }
}
