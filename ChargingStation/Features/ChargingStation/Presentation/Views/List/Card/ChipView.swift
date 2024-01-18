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
      Image(getIconByType(parkingSpot.type))
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
    .foregroundColor(Color.primary)
    .background(Color.backgroundMain)
    .cornerRadius(20)
    .overlay(
      RoundedRectangle(cornerRadius: 20)
        .stroke(Color.primary, lineWidth: 2)
    )
  }
  
  // MARK: - FUNCTIONS
  private func getIconByType(_ type: ChargerType) -> String {
    switch type {
      case .type2_11kW, .type2_22kW:
        return "type2"
      case .ccs2_24kW:
        return "ccs2"
    }
  }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
  let parkingSpot = ParkingSpot(quantity: 2, type: .type2_11kW)
  return ChipView(parkingSpot: parkingSpot)
}
