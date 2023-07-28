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
                ForEach(modelResults.sorted {$0.Model_Name < $1.Model_Name}, id: \.self) { mVM in
                    
                    let baseURL = "https://en.wikipedia.org/wiki"
                    let model = mVM.Model_Name

                    // Encode the vehicleMake and model strings for safe use in a URL
                    let encodedVehicleMake = vehicleMake.replacingOccurrences(of: " ", with: "_").capitalized
                    let encodedModel = model.replacingOccurrences(of: " ", with: "_")

                    let url = "\(baseURL)/\(encodedVehicleMake)_\(encodedModel)"

                    NavigationLink(destination: DetailView(makeModelString: url)) {
                        Text(mVM.Model_Name)
                    }
                }
            }
            .navigationTitle(vehicleMake)
            .searchable(text: $searchModel, placement: .navigationBarDrawer(displayMode: .always))
        }
        .onAppear {
            networkManager.fetchModelData(makeName: vehicleMake.replacingOccurrences(of: " ", with: "%20"))
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
