//
//  EmptyStateView.swift
//  ChargingStation
//
//  Created by Filip Kisić on 15.01.2024..
//

import SwiftUI

struct EmptyListStateView: View {
  var body: some View {
    VStack {
      Image(.emptyListIllustration)
        .resizable()
        .scaledToFit()
        .frame(width: 200)
      Text("No charging stations found...")
        .font(.system(size: 14, weight: .bold, design: .rounded))
        .padding()
    }
  }
}

#Preview {
  EmptyListStateView()
}
