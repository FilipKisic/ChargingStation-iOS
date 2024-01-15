//
//  ContentView.swift
//  ChargingStation
//
//  Created by Filip Kisić on 05.01.2024..
//

import SwiftUI

struct SplashScreenView: View {
  // MARK: - BODY
  var body: some View {
    VStack {
      LottieView(fileName: "loading")
        .frame(width: 200, height: 200)
      Text("Loading...")
        .font(.system(size: 16, weight: .bold, design: .rounded))
    }
  }
}

// MARK: - PREVIEW
#Preview {
  SplashScreenView()
}
