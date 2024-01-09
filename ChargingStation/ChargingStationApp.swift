//
//  ChargingStationApp.swift
//  ChargingStation
//
//  Created by Filip Kisić on 05.01.2024..
//

import SwiftUI
import Resolver

@main
struct ChargingStationApp: App {
  
  init() {
    let chargingStationApi = ChargingStationApi()
    let chargingStationRepository = ChargingStationRepositoryImpl(apiClient: chargingStationApi)
    let getChargingStationUseCase = GetChargingStationUseCase(chargingStationRepository: chargingStationRepository)
    
    Resolver.root.register(GetChargingStationUseCase.self) { getChargingStationUseCase }
  }
  
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}
