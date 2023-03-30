//
//  InfoListView.swift
//  DigiProTechnicalTest
//
//  Created by Américo MQ on 28/03/23.
//

import SwiftUI

struct InfoListView: View {
    @StateObject private var vm = infoListViewModel()
    
    var body: some View {
        List {
            ForEach(vm.userInfo, id: \.id) { info in
                HStack {
                    Image(systemName: "person.circle")
                        .font(.system(size: 50))
                    infoDetailView(info: info)
                }
            }
        }
        .navigationTitle("Lista de usuarios")
        .onAppear {
            vm.getInfo()
        }
    }
}

struct InfoListView_Previews: PreviewProvider {
    static var previews: some View {
        InfoListView()
    }
}
