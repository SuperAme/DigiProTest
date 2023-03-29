//
//  InfoListView.swift
//  DigiProTechnicalTest
//
//  Created by Américo MQ on 28/03/23.
//

import SwiftUI

struct InfoListView: View {
    @StateObject var vm = CoreDataManager()
    
    var body: some View {
        List {
            ForEach(vm.savedEntities) { entity in
                HStack {
                    Image(systemName: "person.circle")
                        .font(.system(size: 50))
                    VStack {
                        HStack {
                            Text(entity.name ?? "")
                            Text(entity.firstLastName ?? "")
                        }
                        Text(String(entity.number))
                        Text(entity.mail ?? "")
                    }
                }
            }
        }
    }
}

struct InfoListView_Previews: PreviewProvider {
    static var previews: some View {
        InfoListView()
    }
}
