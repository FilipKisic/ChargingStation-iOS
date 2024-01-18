//
//  TextButtonView.swift
//  ChargingStation
//
//  Created by Filip Kisić on 17.01.2024..
//

import SwiftUI

struct TextButtonView: View {
  // MARK: - PROPERTIES
  let iconName: String
  let text: String
  var color: Color = .primary
  
  // MARK: - BODY
  var body: some View {
    HStack {
      Image(systemName: iconName).foregroundColor(color)
      Text(text)
        .font(.system(size: 14, design: .rounded))
        .foregroundColor(color)
    } //: HSTACK
  }
}

// MARK: - PREVIEW
#Preview {
  HStack {
    TextButtonView(iconName: "trash.fill", text: "Delete", color: .red)
    TextButtonView(iconName: "pencil", text: "Edit")
  }
}
