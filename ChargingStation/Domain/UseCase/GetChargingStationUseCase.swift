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
  
  func getAll() async throws -> [ChargingStation] {
    return try await chargingStationRepository.getAll()
  }
}
