//
//  ChargingStationRepository.swift
//  ChargingStation
//
//  Created by Filip Kisić on 08.01.2024..
//

import Foundation

protocol ChargingStationRepository {
  func getAll() async throws -> [ChargingStation]
}
