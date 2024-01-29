//
//  EditScreenView.swift
//  ChargingStation
//
//  Created by Filip Kisić on 17.01.2024..
//

import SwiftUI

struct EditScreenView: View {
  // MARK: - PROPERTIES
  @StateObject private var viewModel = ChargingStationViewModel()
  
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
  
  // MARK: - LOCAL STATE
  @State private var isAlertShown = false
  @State private var isLoading = false
  
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
          isDisabled: $isLoading,
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
          isDisabled: $isLoading,
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
          isDisabled: $isLoading,
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
          isDisabled: $isLoading,
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
            createNewStation()
          }
        } label: {
          if viewModel.saveState == .loading {
            Spacer()
            ProgressView()
              .progressViewStyle(CircularProgressViewStyle())
              .foregroundColor(.backgroundMain)
              .padding(.vertical, 10)
            Spacer()
          } else {
            Text("Add charging station")
              .fontWeight(.bold)
              .fontDesign(.rounded)
              .padding(.vertical, 10)
              .frame(maxWidth: .infinity)
          }
        }
        .buttonStyle(.borderedProminent)
        .disabled(isLoading)
      } //: VSTACK
      .padding()
      .ignoresSafeArea(.keyboard, edges: .bottom)
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
      
      if isAlertShown {
        StatusDialog(isShown: $isAlertShown, type: viewModel.saveState == .success ? .success : .error)
      }
    } //: ZSTACK
  }
  
  // MARK: - FUNCTIONS
  private func validateTitle() {
    titleError = title.isEmpty ? "Title must not be empty." : ""
  }
  
  private func validateAddress() {
    addressError = address.isEmpty ? "Address must not be empty." : ""
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
  
  private func createNewStation() {
    isLoading.toggle()
    
    let station = ChargingStation(
      id: nil,
      imageBytes: "",
      title: title,
      address: address,
      latitude: coordinatesFormatter.number(from: latitude)?.doubleValue ?? 0.0,
      longitude: coordinatesFormatter.number(from: longitude)?.doubleValue ?? 0.0,
      parkingSpots: [],
      hasFreeSpots: true
    )
    
    Task {
      await viewModel.save(station)
      withAnimation {
        isAlertShown.toggle()
        isLoading.toggle()
      }
    }
  }
}

// MARK: - PREVIEW
#Preview {
  EditScreenView()
}
