//
//  ChargingStationApi.swift
//  ChargingStation
//
//  Created by Filip Kisić on 08.01.2024..
//

import Foundation

class ChargingStationApi {
  let baseUrl = "http://localhost:8080/api/chargingStation"
  
  /// Retrives data from the Remote API and decodes the response to the list of ChargingStations.
  /// - Throws: `DecodingError` if the response is not properly decoded.
  /// - Returns: List of charging stations -> `[ChargingStation]`.
  func getAllChargingStations() async throws -> [ChargingStation] {
    let url = URL(string: "\(baseUrl)/all")!
    let (data, _) = try await URLSession.shared.data(from: url)
    
    let decoder = JSONDecoder()
    let chargingStations = try decoder.decode([ChargingStation].self, from: data)
    
    return chargingStations
  }
  
  /// Encodes station as content of JSON body and sends it to the Remote API. If the station doesn't exist, it will be created, else it will be updated.
  ///  - Parameter station: New charging station that needs to be created
  ///  - Throws: `EncodingError` if the `station` is not properly encoded
  func save(_ station: ChargingStation) async throws {
    let jsonBody = try JSONEncoder().encode(station)
    
    let url = URL(string: baseUrl)!
    
    var request = URLRequest(url: url)
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpMethod = "POST"
    request.httpBody = jsonBody
    
    try await URLSession.shared.data(for: request)
  }
}

