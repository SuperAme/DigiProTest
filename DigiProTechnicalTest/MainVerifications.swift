//
//  MainVerifications.swift
//  DigiProTechnicalTest
//
//  Created by Américo MQ on 28/03/23.
//

import Foundation

class MainVerifications {
    
    static let shared = MainVerifications()
    
//    init() {}
    
    func validateTextField(text: String) -> Bool {
        let characterSetNotAllowed = CharacterSet.whitespacesAndNewlines
        if text.rangeOfCharacter(from: characterSetNotAllowed) != nil {
            return false
        } else if text.count < 3 {
            return false
        } else {
            return true
        }
    }
}
