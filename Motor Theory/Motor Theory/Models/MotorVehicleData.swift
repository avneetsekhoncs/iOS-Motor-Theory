//
//  MotorVehicleData.swift
//  Motor Theory
//
//  Created by Avneet Sekhon on 2023-07-19.
//

import Foundation

//Format of the data received from the api request
struct ResultsData: Decodable {
    let Results: [MotorVehicle]
}

//Format of the data within the "Results" array that I will be using
struct MotorVehicle: Decodable, Identifiable {
    //Vakue of Make_ID needs to conform to "id" requirement
    var id: Int {
        return Make_ID
    }
    
    let Make_ID: Int
    let Make_Name: String
}
