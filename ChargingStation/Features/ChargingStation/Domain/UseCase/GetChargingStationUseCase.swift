//
//  GetChargingStationUseCase.swift
//  ChargingStation
//
//  Created by Filip Kisić on 08.01.2024..
//

import Foundation

class GetChargingStationUseCase {
  private let chargingStationRepository: ChargingStationRepository
  
  init(chargingStationRepository: ChargingStationRepository) {
    self.chargingStationRepository = chargingStationRepository
  }
  
  /// Returns a list of all chargingStations.
  /// - Throws: `DecodingError` if the response is not properly decoded.
  /// - Returns: List of charging stations -> `[ChargingStation]`.
  func getAll() async throws -> [ChargingStation] {
    return try await chargingStationRepository.getAll()
  }
}
