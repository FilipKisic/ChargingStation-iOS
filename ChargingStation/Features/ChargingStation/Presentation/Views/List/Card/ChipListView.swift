//
//  ChipListView.swift
//  ChargingStation
//
//  Created by Filip Kisić on 11.01.2024..
//

import SwiftUI
import WrappingStack

struct ChipListView: View {
  // MARK: - PROPERTIES
  let parkingSpots: [ParkingSpot]
  
  // MARK: - BODY
  var body: some View {
    return WrappingHStack(id: \.self, alignment: .leading) {
      ForEach(parkingSpots, id: \.self) { spot in
        ChipView(parkingSpot: spot)
          .padding(.horizontal, 3)
          .padding(.vertical, 3)
      } //: ForEach
    } //: WrappingHStack
  }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
  let spots = [
    ParkingSpot(quantity: 10, type: .type2_11kW),
    ParkingSpot(quantity: 1, type: .type2_22kW),
    ParkingSpot(quantity: 2, type: .type2_22kW),
    ParkingSpot(quantity: 3, type: .type2_22kW),
  ]
  
  return VStack(alignment: .leading) {
    ChipListView(parkingSpots: spots)
  }
  .padding()
}
