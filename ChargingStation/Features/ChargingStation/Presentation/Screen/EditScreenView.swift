//
//  EditScreenView.swift
//  ChargingStation
//
//  Created by Filip Kisić on 17.01.2024..
//

import SwiftUI

struct EditScreenView: View {
  // MARK: - TEXT FIELD STATE
  @State private var title: String = ""
  @State private var address: String = ""
  @State private var latitude: String = ""
  @State private var longitude: String = ""
  @FocusState private var focusedField: FocusedField?
  
  // MARK: - ERROR STATE
  @State private var titleError: String = ""
  @State private var addressError: String = ""
  @State private var latitudeError: String = ""
  @State private var longitudeError: String = ""
  
  // MARK: - INPUT FIELD ENUM
  enum FocusedField {
    case title, address, lat, lng
  }
  
  let coordinatesFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.allowsFloats = true
    formatter.locale = Locale.current
    formatter.numberStyle = .decimal
    return formatter
  }()
  
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
          .fontDesign(.rounded)
          .padding(.bottom, 20)
        
        CustomTextField(
          text: $title,
          error: $titleError,
          label: "Title",
          iconName: "pencil"
        )
        .focused($focusedField, equals: .title)
        .onSubmit {
          focusedField = .address
        }
        .padding(.bottom, 10)
        
        CustomTextField(
          text: $address,
          error: $addressError,
          label: "Address",
          iconName: "pencil"
        )
        .focused($focusedField, equals: .address)
        .onSubmit {
          focusedField = .lat
        }
        .padding(.bottom, 10)
        
        CustomTextField(
          text: $latitude,
          error: $latitudeError,
          label: "Latitude",
          iconName: "pencil",
          isNumber: true
        )
        .focused($focusedField, equals: .lat)
        .padding(.bottom, 10)
        
        CustomTextField(
          text: $longitude,
          error: $longitudeError,
          label: "Longitude",
          iconName: "pencil",
          isNumber: true
        )
        .focused($focusedField, equals: .lng)
        .padding(.bottom, 10)
        
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
      .toolbar {
        ToolbarItem(placement: .keyboard) {
          Spacer()
        }
        
        ToolbarItem(placement: .keyboard) {
          Button {
            focusedField = nil
          } label: {
            Image(systemName: "keyboard.chevron.compact.down")
          }
        } //: TOOLBAR ITEM
      } //: TOOLBAR
    } //: ZSTACK
  }
}

// MARK: - PREVIEW
#Preview {
  EditScreenView()
}

//Form {
//  TextField("Title", text: $title)
//    .textFieldStyle(.plain)
//  TextField("Address", text: $address)
//    .textFieldStyle(.plain)
//  //TextField("Latitude", value: $latitude)
//    //.textFieldStyle(.plain)
//  //TextField("Longitude", value: $longitude)
//    //.textFieldStyle(.plain)
//}
//.background(.backgroundMain).scrollContentBackground(.hidden)
