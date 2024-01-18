//
//  EditScreenView.swift
//  ChargingStation
//
//  Created by Filip Kisić on 17.01.2024..
//

import SwiftUI

struct EditScreenView: View {
  // MARK: - PROPERTIES
  @State private var title: String = ""
  @State private var address: String = ""
  @State private var latitude: Double = 0.0
  @State private var longitude: Double = 0.0
  
  // MARK: - PREVIEW
  var body: some View {
    ZStack {
      Color.backgroundMain.ignoresSafeArea()
      VStack (alignment: .leading) {
        Text("Add new charging station")
          .font(.title)
          .fontWeight(.bold)
          .fontDesign(.rounded)
          .listRowInsets(.none)
        Text("Please enter all details about the station.")
          .font(.caption)
        
        Form {
          TextField("Title", text: $title)
            .textFieldStyle(CustomTextFieldStyle())
            .listRowInsets(.init())
          TextField("Address", text: $address)
            .textFieldStyle(.plain)
          TextField("Address", text: $address)
            .textFieldStyle(.plain)
        }
        .background(.backgroundMain).scrollContentBackground(.hidden)
        
        Spacer()
        
        Button {
          print("Add new charging station")
        } label: {
          Text("Add charging station")
            .fontWeight(.bold)
            .fontDesign(.rounded)
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
      } //: VSTACK
      .padding()
    }
  }
}

// MARK: - PREVIEW
#Preview {
  EditScreenView()
}
