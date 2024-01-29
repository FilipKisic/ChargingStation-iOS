//
//  CardItemView.swift
//  ChargingStation
//
//  Created by Filip Kisić on 10.01.2024..
//

import SwiftUI

struct CardView: View {
  // MARK: - PROPERTIES
  let chargingStation: ChargingStation
  let isEditable: Bool
  
  // MARK: - BODY
  var body: some View {
    VStack {
      HStack {
        Image(uiImage: (chargingStation.imageBytes.isEmpty ? .errorIllustration : ImageConverter.base64ToImage(chargingStation.imageBytes))!)
          .resizable()
          .scaledToFill()
          .frame(width: 100, height: calculateImageHeight())
          .cornerRadius(10.0)
        
        VStack(alignment: .leading) {
          Text(chargingStation.title)
            .font(.system(size: 14, weight: .bold, design: .rounded))
          Text(chargingStation.address)
            .foregroundStyle(.gray)
            .font(.system(size: 14, design: .rounded))
          ChipListView(parkingSpots: chargingStation.parkingSpots)
          
          Spacer()
          
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
        .padding(.horizontal, 5)
        
      } //: HSTACK
      if isEditable {
        HStack {
          Spacer()
          TextButtonView(iconName: "trash.fill", text: "Delete", color: .red)
          Spacer()
          TextButtonView(iconName: "pencil", text: "Edit")
          Spacer()
        } //: HSTACK
        .padding(.vertical, 5)
      } //: IF CLAUSE
    } //: VSTACK
    .frame(height: calculateHeight())
    .padding(20)
    .background(.backgroundMain)
    .cornerRadius(20)
    .shadow(color: .secondary.opacity(0.20), radius: 5, x: 0, y: 5)
  }
  
  // MARK: - FUNCTIONS
  private func calculateImageHeight() -> CGFloat {
    return isEditable ? calculateHeight() - 40 : calculateHeight()
  }
  
  private func calculateHeight() -> CGFloat {
    let numberOfTypes = self.chargingStation.parkingSpots.count
    let numOfRows = numberOfTypes % 2 == 0 ? numberOfTypes / 2 : (numberOfTypes / 2) + 1
    
    if numOfRows == 1 {
      return isEditable ? 140 : 110
    } else {
      return CGFloat ((isEditable ? 140 : 110) + (numOfRows - 1) * 20)
    }
  }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
  let spotOne = ParkingSpot(quantity: 2, type: .type2_22kW)
  let spotTwo = ParkingSpot(quantity: 11, type: .type2_11kW)
  let spotThree = ParkingSpot(quantity: 4, type: .type2_11kW)
  let spotFour = ParkingSpot(quantity: 1, type: .ccs2_24kW)
  let spotFive = ParkingSpot(quantity: 3, type: .ccs2_24kW)
  let spotSix = ParkingSpot(quantity: 16, type: .type2_11kW)
  
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
  
  return CardView(chargingStation: chargingStation, isEditable: true).padding()
}
