//
//  ChipView.swift
//  ChargingStation
//
//  Created by Filip Kisić on 11.01.2024..
//

import SwiftUI

struct ChipView: View {
  // MARK: - PROPERTIES
  let parkingSpot: ParkingSpot
  
  // MARK: - BODY
  var body: some View {
    HStack(spacing: 4) {
      Image("Type2Icon")
        .resizable()
        .scaledToFit()
        .frame(height: 20)
      Text("\(parkingSpot.type.short) - x\(parkingSpot.quantity)")
        .font(.system(size: 10))
        .lineLimit(1)
    } //: HSTACK
    .padding(.vertical, 2)
    .padding(.leading, 4)
    .padding(.trailing, 10)
    .foregroundColor(Color.black)
    .background(Color.white)
    .cornerRadius(20)
    .overlay(
      RoundedRectangle(cornerRadius: 20)
        .stroke(Color.black, lineWidth: 2)
    )
  }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
  let parkingSpot = ParkingSpot(quantity: 2, type: .type2_11kW)
  return ChipView(parkingSpot: parkingSpot)
}
