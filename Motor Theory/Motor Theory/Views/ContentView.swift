//
//  ContentView.swift
//  Motor Theory
//
//  Created by Avneet Sekhon on 2023-07-19.
//

import SwiftUI

struct ContentView: View {
    
    //Listens for changes to motorVehicles in NetworkManager
    @ObservedObject var networkManager = NetworkManager()
    @State private var searchText = ""
    
    var body: some View {
        // Creating the root view
        NavigationStack {
            // List presents rows from the data provided
            List {
                ForEach(searchResults, id: \.self) { mV in
                    //vehicleMake is passed to the destination
                    NavigationLink(destination: ModelView(vehicleMake: mV.MakeName)) {
                        // The Make's name fills each row
                        Text(mV.MakeName)
                    }
                }
            }
            .navigationTitle("MOTOR THEORY")
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        }
        .tint(.orange)
        .onAppear { networkManager.fetchData() }
    }
    
    var searchResults: [MotorVehicle] {
        if searchText.isEmpty {
            return networkManager.motorVehicles
        } else {
            return networkManager.motorVehicles.filter { $0.MakeName.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
