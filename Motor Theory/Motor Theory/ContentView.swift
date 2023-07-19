//
//  ContentView.swift
//  Motor Theory
//
//  Created by Avneet Sekhon on 2023-07-19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // Creating the root view
        NavigationStack {
            // List presents rows from the data provided
            List(motorVehicles) { mV in
                // The Make's name fills each row
                Text(mV.Make_Name)
            }
            
            // Title of the current view
            .navigationTitle("Motor Theory")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
