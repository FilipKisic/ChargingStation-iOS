//
//  CustomTextFieldTest.swift
//  ChargingStation
//
//  Created by Filip Kisić on 19.01.2024..
//

import SwiftUI

struct CustomTextField: View {
  // MARK: - BINDINGS
  @Binding var text: String
  @Binding var error: String
  @Binding var isDisabled: Bool
  
  // MARK: - PROPERTIES
  let label: String
  let iconName: String
  var isNumber: Bool = false
  var validation: () -> Void
  
  // MARK: - BODY
  var body: some View {
    return VStack(alignment: .leading) {
      HStack {
        TextField(label, text: $text)
          .fontDesign(.rounded)
          .padding(.horizontal, 10)
          .padding(.vertical, 12)
          .onChange(of: text) {
            validation()
          }
          .disabled(isDisabled)
          .if(isNumber) { view in
            view.numbersOnly($text, isDecimal: true)
          }
        
        Image(systemName: iconName)
          .resizable()
          .scaledToFit()
          .frame(width: 20, height: 20)
          .foregroundColor(.secondary.opacity(0.35))
          .padding(.trailing, 10)
      } //: HSTACK
      .background(.backgroundMain)
      .shadow(color: .secondary.opacity(0.35), radius: 10, x: 0, y: 5)
      .overlay(
        RoundedRectangle(cornerRadius: 5)
          .stroke(.secondary, lineWidth: 2)
      )
      
      if !error.isEmpty {
        Text(error)
          .font(.caption)
          .fontDesign(.rounded)
          .foregroundStyle(.red)
      }
    } //: VSTACK
  }
}

// MARK: - PREVIEW
#Preview {
  @State var title = ""
  @State var error = ""
  @State var isDisabled = false
  
  func validateTitle() {
    if title.isEmpty {
      error = "Hey"
    }
  }
  
  return CustomTextField(
    text: $title,
    error: $error,
    isDisabled: $isDisabled,
    label: "Title",
    iconName: "arrow.up.and.down",
    validation: validateTitle
  )
  .padding()
}

extension View {
  @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
    if condition {
      transform(self)
    } else {
      self
    }
  }
}
