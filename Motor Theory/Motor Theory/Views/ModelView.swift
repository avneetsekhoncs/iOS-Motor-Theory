//
//  ModelView.swift
//  Motor Theory
//
//  Created by Avneet Sekhon on 2023-07-24.
//

import SwiftUI

struct ModelView: View {
    
    //Listens for changes to motorVehicles in NetworkManager
    @ObservedObject var networkManager = NetworkManager()
    
    @State private var searchModel = ""
    
    let vehicleMake: String
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(modelResults, id: \.self) { mVM in
                    let url = "https://en.wikipedia.org/wiki/\(vehicleMake.lowercased())_\(mVM.Model_Name.components(separatedBy: .whitespaces).joined())"
                    NavigationLink(destination: DetailView(makeModelString: url)) {
                        Text(mVM.Model_Name)
                    }
                }
            }
            .navigationTitle(vehicleMake)
            .searchable(text: $searchModel, placement: .navigationBarDrawer(displayMode: .always))
        }
        .onAppear {
            networkManager.fetchModelData(makeName: vehicleMake)
        }
    }
    
    var modelResults: [MotorVehicleModels] {
        if searchModel.isEmpty {
            return networkManager.motorVehicleModels
        } else {
            return networkManager.motorVehicleModels.filter { $0.Model_Name.localizedCaseInsensitiveContains(searchModel) }
        }
    }
}

struct ModelView_Previews: PreviewProvider {
    static var previews: some View {
        ModelView(vehicleMake: "AUDI")
    }
}
