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
  
  // MARK: - BODY
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
          iconName: "pencil",
          validation: validateTitle
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
          iconName: "building.2",
          validation: validateAddress
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
          iconName: "arrow.up.and.down",
          isNumber: true,
          validation: validateLatitude
        )
        .focused($focusedField, equals: .lat)
        .padding(.bottom, 10)
        
        CustomTextField(
          text: $longitude,
          error: $longitudeError,
          label: "Longitude",
          iconName: "arrow.left.and.right",
          isNumber: true,
          validation: validateLongitude
        )
        .focused($focusedField, equals: .lng)
        .padding(.bottom, 10)
        
        Spacer()
        
        Button {
          if isFormValid() {
            print("Add new charging station")
          }
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
  
  // MARK: - FUNCTIONS
  private func validateTitle() {
    if title.isEmpty {
      titleError = "Title must not be empty."
    } else {
      titleError = ""
    }
  }
  
  private func validateAddress() {
    if address.isEmpty {
      addressError = "Address must not be empty."
    } else {
      addressError = ""
    }
  }
  
  private func validateLatitude() {
    let latitudeNumber =  Double(latitude) ?? 0.0
    
    if latitude.isEmpty {
      latitudeError = "Latitude must not be empty."
    } else if latitudeNumber < -90.0 || latitudeNumber > 90.0 {
      latitudeError = "Latitude must be in range between -90.0 and 90.0."
    } else {
      latitudeError = ""
    }
  }
  
  private func validateLongitude() {
    let longitudeNumber = Double(longitude) ?? 0.0
    
    if longitude.isEmpty {
      longitudeError = "Longitude must not be empty."
    } else if longitudeNumber < -180 || longitudeNumber > 180 {
      longitudeError = "Longitude must be in range between -180.0 nad 180.0."
    } else {
      longitudeError = ""
    }
  }
  
  private func isFormValid() -> Bool {
    validateTitle()
    validateAddress()
    validateLatitude()
    validateLongitude()
    return titleError.isEmpty && addressError.isEmpty && latitudeError.isEmpty && longitudeError.isEmpty
  }
}

// MARK: - PREVIEW
#Preview {
  EditScreenView()
}
