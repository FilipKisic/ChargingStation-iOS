//
//  ChargingStationViewModel.swift
//  ChargingStation
//
//  Created by Filip Kisić on 08.01.2024..
//

import Foundation
import Dependency

class ChargingStationViewModel: ObservableObject {
  // MARK: - DEPENDENCIES
  @Dependency(\.getChargingStationUseCase) private var getChargingStationUseCase
  
  // MARK: - STATE
  @Published var chargingStationListState = ChargingStationListState.loading
  
  // MARK: - FUNCTIONS
  func getAll() async {
    self.chargingStationListState = .loading
    do {
      let result = try await getChargingStationUseCase.getAll()
      if (result.isEmpty) {
        self.chargingStationListState = .empty
      } else {
        self.chargingStationListState = .success(result)
      }
    } catch {
      self.chargingStationListState = .error(error)
    }
  }
}

enum ChargingStationListState {
  case loading
  case success([ChargingStation])
  case empty
  case error(Error)
}
