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

// Each motor vehicle instance should provide this data
struct motorVehicle: Identifiable {
    let id: String
    let Make_Name: String
}

// List of motor vehicle makes with a corresponding id
let motorVehicles = [
    motorVehicle(id: "1", Make_Name: "Audi"),
    motorVehicle(id: "2", Make_Name: "Lamborghini"),
    motorVehicle(id: "3", Make_Name: "Ferrari")
]
