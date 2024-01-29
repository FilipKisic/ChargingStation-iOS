//
//  GetChargingStationUseCase.swift
//  ChargingStation
//
//  Created by Filip Kisić on 08.01.2024..
//

import Foundation

class GetChargingStationUseCase {
  private let repository: ChargingStationRepository
  
  init(repository: ChargingStationRepository) {
    self.repository = repository
  }
  
  /// Returns a list of all charging stations.
  /// - Throws: `DecodingError` if the response is not properly decoded.
  /// - Returns: List of charging stations -> `[ChargingStation]`.
  func getAll() async throws -> [ChargingStation] {
    return try await repository.getAll()
  }
}
