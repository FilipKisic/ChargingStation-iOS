//
//  CardListView.swift
//  ChargingStation
//
//  Created by Filip Kisić on 15.01.2024..
//

import SwiftUI

struct CardListView: View {
  // MARK: - PROPERTIES
  let chargingStations: [ChargingStation]
  
  // MARK: - BODY
  var body: some View {
    List(chargingStations, id: \.id) { chargingStation in
      CardView(chargingStation: chargingStation)
        .listRowSeparator(.hidden)
        .listRowBackground(Color.clear)
    } //: LIST
    .listStyle(.plain)
  }
}

// MARK: - PREVIEW
#Preview {
  let spotOne = ParkingSpot(quantity: 2, type: .type2_22kW)
  let spotTwo = ParkingSpot(quantity: 11, type: .type2_11kW)
  let spotThree = ParkingSpot(quantity: 4, type: .type2_11kW)
  
  let chargingStationOne = ChargingStation(
    id: 1,
    imageBytes: "",
    title: "Charging Station Porsche",
    address: "38 Im Birkenwald, Stuttgart",
    latitude: 42.128,
    longitude: 32.16,
    parkingSpots: [spotOne, spotTwo, spotThree],
    hasFreeSpots: true
  )
  
  let chargingStationTwo = ChargingStation(
    id: 2,
    imageBytes: "",
    title: "Charging Station BMW",
    address: "69 Wagen Strasse, Munich",
    latitude: 42.128,
    longitude: 32.16,
    parkingSpots: [spotOne, spotTwo],
    hasFreeSpots: true
  )
  
  return ZStack {
    LinearGradient(colors: [.backgroundGreen, .backgroundWhite], startPoint: .top, endPoint: .bottom)
      .edgesIgnoringSafeArea(.all)
    CardListView(chargingStations: [chargingStationOne, chargingStationTwo])
  }
}
