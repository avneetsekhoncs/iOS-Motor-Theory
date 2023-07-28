//
//  NetworkManager.swift
//  Motor Theory
//
//  Created by Avneet Sekhon on 2023-07-19.
//

import Foundation

// Conform to ObservableObject to broadcast properties to "interested parties"
class NetworkManager: ObservableObject {
    
    // "Interested parties" will be notified of any changes
    //@Published var filteredVehicles = [MotorVehicle]()
    @Published var motorVehicleModels = [MotorVehicleModels]()
    @Published var motorVehicles = [MotorVehicle]()
    
    //let keepArray = ["AUDI", "BENTLEY", "FORD", "HONDA", "NISSAN"]
    
    func fetchData() {
        //The url I am going to request to
        if let url = URL(string: "https://vpic.nhtsa.dot.gov/api/vehicles/GetMakesForVehicleType/car?format=json") {
            //Setup to get data from endpoint
            let session = URLSession(configuration: .default)
            let dataTask = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            //Data from the api
                            let decoded = try decoder.decode(ResultsData.self, from: safeData)
                            DispatchQueue.main.async {
                                self.motorVehicles = decoded.Results
                                /*self.filteredVehicles = self.motorVehicles.filter { motorVehicle in
                                    self.keepArray.contains(motorVehicle.Make_Name)
                                }*/
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            //Start networking task
            dataTask.resume()
        }
    }
    
    func fetchModelData(makeName: String) {
        //The url I am going to request to
        if let url = URL(string: "https://vpic.nhtsa.dot.gov/api/vehicles/getmodelsformakeyear/make/\(makeName)/vehicleType/car?format=json") {
            //Setup to get data from endpoint
            let session = URLSession(configuration: .default)
            let dataTask = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            //Data from the api
                            let decoded = try decoder.decode(ModelsData.self, from: safeData)
                            DispatchQueue.main.async {
                                self.motorVehicleModels = decoded.Results
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            //Start networking task
            dataTask.resume()
        }
    }
}
