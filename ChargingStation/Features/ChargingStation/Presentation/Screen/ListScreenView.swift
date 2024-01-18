//
//  ListScreenView.swift
//  ChargingStation
//
//  Created by Filip Kisić on 10.01.2024..
//

import SwiftUI

struct ListScreenView: View {
  // MARK: - PROPERTIES
  @StateObject private var chargingStationViewModel = ChargingStationViewModel()
  
  // MARK: - CONSTRUCTOR
  init() {
    var titleFont = UIFont.preferredFont(forTextStyle: .largeTitle)
    titleFont = UIFont(
      descriptor: titleFont.fontDescriptor.withDesign(.rounded)?.withSymbolicTraits(.traitBold) ?? titleFont.fontDescriptor,
      size: titleFont.pointSize
    )
    
    UINavigationBar.appearance().largeTitleTextAttributes = [.font: titleFont]
  }
  
  // MARK: - BODY
  var body: some View {
    NavigationView {
      ZStack {
        LinearGradient(colors: [.backgroundAccent, .backgroundMain], startPoint: .top, endPoint: .bottom)
          .edgesIgnoringSafeArea(.all)
        VStack {
          switch chargingStationViewModel.chargingStationListState {
            case .loading:
              ProgressView()
            case .empty:
              EmptyListStateView()
            case .success(let chargingStations):
              CardListView(chargingStations: chargingStations, isEditable: false)
            case .error(let error):
              ErrorListStateView(errorMessage: error.localizedDescription)
          }
        } //: VSTACK
      } //: ZSTACK
      .navigationTitle("Charging stations")
      .toolbarBackground(Color.backgroundMain, for: .navigationBar)
      .onAppear{
        Task {
          await chargingStationViewModel.getAll()
        }
      }
    }
  }
}

// MARK: - PREVIEW
#Preview {
  NavigationStack {
    ListScreenView()
  }
}
