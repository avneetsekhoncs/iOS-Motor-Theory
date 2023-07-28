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

struct ModelsData: Decodable {
    let Results: [MotorVehicleModels]
}

//Format of the data within the "Results" array that I will be using
struct MotorVehicle: Decodable, Identifiable, Hashable {
    //Value of Make_ID needs to conform to "id" requirement
    var id: Int {
        return MakeId
    }
    
    let MakeId: Int
    let MakeName: String
}

struct MotorVehicleModels: Decodable, Identifiable, Hashable {
    var id: Int {
        return Model_ID
    }
    
    let Model_ID: Int
    let Model_Name: String
}
