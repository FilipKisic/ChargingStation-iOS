//
//  ErrorStateView.swift
//  ChargingStation
//
//  Created by Filip Kisić on 15.01.2024..
//

import SwiftUI

struct ErrorListStateView: View {
  // MARK: - PROPERTIES
  let errorMessage: String
  
  // MARK: - BODY
  var body: some View {
    Image(.errorIllustration)
      .resizable()
      .scaledToFit()
      .frame(width: 100)
    Text("There was an error: \(errorMessage)")
      .frame(width: 250)
      .font(.system(size: 16, weight: .bold, design: .rounded))
      .multilineTextAlignment(.center)
      .padding()
  }
}

// MARK: - PREVIEW
#Preview {
  ErrorListStateView(errorMessage: "Could not connect to the server.")
}
