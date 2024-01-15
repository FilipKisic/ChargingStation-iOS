//
//  DependecyInjectionContainer.swift
//  ChargingStation
//
//  Created by Filip Kisić on 15.01.2024..
//

import Foundation
import Dependency

// MARK: - API
private struct ChargingStationApiKey: DependencyKey {
  static var currentValue: ChargingStationApi = ChargingStationApi()
}

// MARK: - REPOSITORY
private struct ChargingStationRepositoryKey: DependencyKey {
  @Dependency(\.chargingStationApi) private static var chargingStationApi
  static var currentValue: ChargingStationRepository = ChargingStationRepositoryImpl(apiClient: chargingStationApi)
}

// MARK: - USE CASE
private struct GetChargingStationUseCaseKey: DependencyKey {
  @Dependency(\.chargingStationRepository) private static var chargingStationRepository
  static var currentValue: GetChargingStationUseCase = GetChargingStationUseCase(chargingStationRepository: chargingStationRepository)
}

extension DependencyValues {
  var chargingStationApi: ChargingStationApi {
    get { Self[ChargingStationApiKey.self] }
    set { Self[ChargingStationApiKey.self] = newValue }
  }
  
  var chargingStationRepository: ChargingStationRepository {
    get { Self[ChargingStationRepositoryKey.self] }
    set { Self[ChargingStationRepositoryKey.self] = newValue }
  }
  
  var getChargingStationUseCase: GetChargingStationUseCase {
    get { Self[GetChargingStationUseCaseKey.self] }
    set { Self[GetChargingStationUseCaseKey.self] = newValue }
  }
}
