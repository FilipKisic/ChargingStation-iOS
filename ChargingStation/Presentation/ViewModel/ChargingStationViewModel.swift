//
//  ChargingStationViewModel.swift
//  ChargingStation
//
//  Created by Filip Kisić on 08.01.2024..
//

import Foundation
import Resolver

class ChargingStationViewModel: ObservableObject {
  // MARK: - DEPENDENCIES
  @Injected var getChargingStationUseCase: GetChargingStationUseCase //add private modifier
  
  init(@Injected getChargingStationUseCase: GetChargingStationUseCase) {
    self.getChargingStationUseCase = getChargingStationUseCase
  }
  
  // MARK: - STATE
  @Published var chargingStaionListState = ChargingStationListState.loading
  
  // MARK: - FUNCTIONS
  func getAll() async {
    self.chargingStaionListState = .loading
    do {
      let result = try await getChargingStationUseCase.getAll()
      self.chargingStaionListState = .success(result)
    } catch {
      self.chargingStaionListState = .error(error)
    }
  }
}

enum ChargingStationListState {
  case loading
  case success([ChargingStation])
  case error(Error)
}
