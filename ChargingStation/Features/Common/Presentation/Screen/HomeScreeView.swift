//
//  HomeScreeView.swift
//  ChargingStation
//
//  Created by Filip Kisić on 10.01.2024..
//

import SwiftUI

struct HomeScreeView: View {
  // MARK: - PROPERTIES
  @State private var isLoading = true
  
  // MARK: - BODY
  var body: some View {
    NavigationStack {
      ZStack {
        if self.isLoading {
          SplashScreenView()
        } else {
          TabView {
            ListScreenView()
              .tabItem {
                Label("", systemImage: "ev.charger.fill")
              }
            ManagementScreenView()
              .tabItem {
                Label("", systemImage: "slider.horizontal.2.square")
              }
            SettingsScreenView()
              .tabItem {
                Label("", systemImage: "gear")
              }
          }
        }
      }
      .onAppear {
        fakeLoading()
      }
    }
  }
  
  // MARK: - FUNCTIONS
  func fakeLoading() {
    Task {
      try await Task.sleep(for: Duration.seconds(2))
      withAnimation {
        self.isLoading = false
      }
    }
  }
}

// MARK: - PREVIEW
#Preview {
  HomeScreeView()
}
