//
//  NetworkManager.swift
//  Motor Theory
//
//  Created by Avneet Sekhon on 2023-07-19.
//

import Foundation


class NetworkManager {
    func fetchData() {
        //The url I am going to request to
        if let url = URL(string: "https://vpic.nhtsa.dot.gov/api/vehicles/getallmakes?format=json") {
            //Setup to get data from endpoint
            let session = URLSession(configuration: .default)
            let dataTask = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let decoded = try decoder.decode(ResultsData.self, from: safeData)
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
