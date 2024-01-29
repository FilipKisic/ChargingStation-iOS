//
//  CreateChargingStationUseCase.swift
//  ChargingStation
//
//  Created by Filip Kisić on 25.01.2024..
//

import Foundation

class SaveChargingStationUseCase {
  private let repository: ChargingStationRepository
  
  init(repository: ChargingStationRepository) {
    self.repository = repository
  }
  
  /// Creates a new charging station.
  ///  - Parameter station: New charging station that needs to be created.
  ///  - Throws: `EncodingError` if `station` object is not properly encoded.
  func execute(_ station: ChargingStation) async throws {
    try await repository.save(station)
  }
}
