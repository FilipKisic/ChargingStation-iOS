//
//  ChargingStationViewModel.swift
//  ChargingStation
//
//  Created by Filip Kisić on 08.01.2024..
//

import Foundation
import Dependency

@MainActor
class ChargingStationViewModel: ObservableObject {
  // MARK: - DEPENDENCIES
  @Dependency(\.getChargingStationUseCase) private var getChargingStationUseCase
  @Dependency(\.saveChargingStationUseCase) private var saveChargingStationUseCase
  
  // MARK: - STATE
  @Published var listState = ChargingStationListState.loading
  @Published var saveState = ChargingStationSaveState.initial
  
  // MARK: - FUNCTIONS
  func getAll() async {
    self.listState = .loading
    do {
      let result = try await getChargingStationUseCase.getAll()
      if (result.isEmpty) {
        self.listState = .empty
      } else {
        self.listState = .success(result)
      }
    } catch {
      self.listState = .error(error)
    }
  }
  
  func save(_ station: ChargingStation) async {
    self.saveState = .loading
    do {
      try await Task.sleep(nanoseconds: 3_000_000_000)
      try await saveChargingStationUseCase.execute(station)
      self.saveState = .success
    } catch {
      self.saveState = .error(error)
    }
  }
}

enum ChargingStationListState {
  case loading
  case success([ChargingStation])
  case empty
  case error(Error)
}

enum ChargingStationSaveState: Equatable {
  case initial
  case loading
  case success
  case error(Error)
  
  static func == (lhs: ChargingStationSaveState, rhs: ChargingStationSaveState) -> Bool {
    switch (lhs, rhs) {
      case (.initial, .initial): return true
      case (.loading, .loading): return true
      case (.success, .success): return true
      case (.error(let e1), .error(let e2)) where e1.localizedDescription == e2.localizedDescription: return true
      case _: return false
    }
  }
}
