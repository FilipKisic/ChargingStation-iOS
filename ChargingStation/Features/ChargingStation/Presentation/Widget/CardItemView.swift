//
//  CardItemView.swift
//  ChargingStation
//
//  Created by Filip Kisić on 10.01.2024..
//

import SwiftUI

struct CardItemView: View {
  // MARK: - PROPERTIES
  let chargingStation: ChargingStation
  
  // MARK: - BODY
  var body: some View {
    HStack {
      Image(.myProfile)
        .resizable()
        .scaledToFill()
        .frame(width: 100, height: 110)
        .cornerRadius(10.0)
      VStack(alignment: .leading) {
        Text(chargingStation.title)
          .font(.system(size: 14, weight: .bold, design: .rounded))
        Text(chargingStation.address)
          .foregroundStyle(.gray)
          .font(.system(size: 14, design: .rounded))
        ChipListView(parkingSpots: chargingStation.parkingSpots)
        if chargingStation.hasFreeSpots {
          Text("Free parking spots")
            .font(.system(size: 12, weight: .bold, design: .rounded))
            .foregroundStyle(.accent)
        } else {
          Text("All spots are occupied")
            .font(.system(size: 12, weight: .bold, design: .rounded))
            .foregroundStyle(.red)
        }
        
      } //: VSTACK
      .padding(.horizontal)
    } //: HSTACK
    .padding()
    .background(Color.white)
    .cornerRadius(20)
    .shadow(radius:  10, x: 0, y: 5)
  }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
  let spotOne = ParkingSpot(quantity: 2, type: .type2_22kW)
  let spotTwo = ParkingSpot(quantity: 11, type: .type2_11kW)
  let spotThree = ParkingSpot(quantity: 4, type: .type2_11kW)
  
  let chargingStation = ChargingStation(
    id: 1,
    imageBytes: "",
    title: "Charging Station Porsche",
    address: "38 Im Birkenwald, Stuttgart",
    latitude: 42.128,
    longitude: 32.16,
    parkingSpots: [spotOne, spotTwo, spotThree],
    hasFreeSpots: true
  )
  
  return VStack {
    CardItemView(chargingStation: chargingStation)
    CardItemView(chargingStation: chargingStation)
    CardItemView(chargingStation: chargingStation)
    CardItemView(chargingStation: chargingStation)
  }
  .padding()
  .edgesIgnoringSafeArea(.all)
}
