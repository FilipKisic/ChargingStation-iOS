//
//  CustomTextField.swift
//  ChargingStation
//
//  Created by Filip Kisić on 17.01.2024..
//

import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle {
  func _body(configuration: TextField<Self._Label>) -> some View {
    configuration
      .padding(10)
      .background(.white)
      .cornerRadius(20)
      .shadow(color: .gray, radius: 10)
  }
}
