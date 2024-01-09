//
//  ContentView.swift
//  ChargingStation
//
//  Created by Filip Kisić on 05.01.2024..
//

import SwiftUI

struct ContentView: View {
  @StateObject var viewModel = ChargingStationViewModel() //add private modifier
  
  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
      Text("Hello, world!")
    }
    .padding()
  }
}

#Preview {
  ContentView()
}
