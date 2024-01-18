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
}
