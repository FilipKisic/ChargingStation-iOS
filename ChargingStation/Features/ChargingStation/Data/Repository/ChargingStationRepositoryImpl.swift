//
//  ChargingStationRepositoryImpl.swift
//  ChargingStation
//
//  Created by Filip Kisić on 08.01.2024..
//

import Foundation

class ChargingStationRepositoryImpl : ChargingStationRepository {
  
  private let apiClient: ChargingStationApi
  
  init(apiClient: ChargingStationApi) {
    self.apiClient = apiClient
  }
  
  func getAll() async throws -> [ChargingStation] {
    return try await apiClient.getAllChargingStations()
  }
  
  func save(_ station: ChargingStation) async throws {
    return try await apiClient.save(station)
  }
}
