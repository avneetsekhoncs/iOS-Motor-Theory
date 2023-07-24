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
    
    var body: some View {
        // Creating the root view
        NavigationStack {
            // List presents rows from the data provided
            List(networkManager.filteredVehicles) { mV in
                //vehicleMake is passed to the destination
                NavigationLink(destination: ModelView(vehicleMake: mV.Make_Name)) {
                    // The Make's name fills each row
                    Text(mV.Make_Name)
                }
            }
            
            // Title of the current view
            .navigationTitle("Motor Theory")
        }
        .onAppear {
            networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
