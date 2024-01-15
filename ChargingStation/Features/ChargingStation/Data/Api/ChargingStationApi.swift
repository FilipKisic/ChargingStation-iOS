//
//  ChargingStationApi.swift
//  ChargingStation
//
//  Created by Filip Kisić on 08.01.2024..
//

import Foundation

class ChargingStationApi {
  let baseUrl = "http://localhost:8080/api/chargingStation"
  
  func getAllChargingStations() async throws -> [ChargingStation] {
    let url = URL(string: "\(baseUrl)/all")!
    let (data, _) = try await URLSession.shared.data(from: url)
    
    let decoder = JSONDecoder()
    let chargingStations = try decoder.decode([ChargingStation].self, from: data)
    
    return chargingStations
  }
}
