//
//  ChargingStationRepository.swift
//  ChargingStation
//
//  Created by Filip Kisić on 08.01.2024..
//

import Foundation

protocol ChargingStationRepository {
  /// Get all chargingStations from the datasource.
  /// - Throws: `DecodingError` if the response is not properly decoded.
  /// - Returns: List of charging stations -> `[ChargingStation]`.
  func getAll() async throws -> [ChargingStation]
  
  /// If station doesn't exist, the datasource will create new, else it will update the existing station.
  ///  - Parameter station: New charging station that needs to be created.
  ///  - Throws: `EncodingError` if the new charging station is not properly encoded.
  func save(_ station: ChargingStation) async throws -> Void
}
