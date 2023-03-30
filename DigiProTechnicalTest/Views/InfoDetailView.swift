//
//  InfoDetailView.swift
//  DigiProTechnicalTest
//
//  Created by Américo MQ on 29/03/23.
//

import SwiftUI

struct infoDetailView: View {
    let info: infoViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text(info.name)
                Text(info.lastname)
            }
            Text(String(info.phone))
            Text(info.mail)
        }
    }
}
