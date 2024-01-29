//
//  ManagementScreenView.swift
//  ChargingStation
//
//  Created by Filip Kisić on 10.01.2024..
//

import SwiftUI
import Dependency

struct ManagementScreenView: View {
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
          switch chargingStationViewModel.listState {
            case .loading:
              ProgressView()
            case .empty:
              EmptyListStateView()
            case .success(let chargingStations):
              CardListView(chargingStations: chargingStations, isEditable: true)
            case .error(let error):
              ErrorListStateView(errorMessage: error.localizedDescription)
          }
        } //: VSTACK
      } // ZSTACK
      .navigationTitle("Management")
      .toolbarBackground(Color.backgroundAccent, for: .navigationBar)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
          } label: {
            NavigationLink(destination: EditScreenView()) {
              Image(systemName: "plus.circle.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.primary)
            } //: NAVIGATION LINK
          } //: BUTTON
        } //: TOOLBAR ITEM
      } //: TOOLBAR
      .onAppear {
        Task {
          await chargingStationViewModel.getAll()
        }
      }
    } //: NAVIGATION VIEW
  }
}

// MARK: - PREVIEW
#Preview {
  ManagementScreenView()
}
