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
    
    let vehicleMake: String
    
    var body: some View {
        NavigationStack {
            List(networkManager.motorVehicleModels) { mVM in
                Text(mVM.Model_Name)
            }
            .navigationTitle(vehicleMake)
        }
        .onAppear {
            networkManager.fetchModelData(makeName: vehicleMake)
        }
    }
}

struct ModelView_Previews: PreviewProvider {
    static var previews: some View {
        ModelView(vehicleMake: "AUDI")
    }
}
