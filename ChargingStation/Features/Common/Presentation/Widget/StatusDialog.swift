//
//  StatusDialog.swift
//  ChargingStation
//
//  Created by Filip Kisić on 28.01.2024..
//

import SwiftUI

struct StatusDialog: View {
  // MARK: - PROPERTIES
  @Environment(\.dismiss) private var dismiss
  @Binding var isShown: Bool
  let type: StatusType
  
  // MARK: - BODY
  var body: some View {
    ZStack {
      Rectangle()
        .foregroundColor(.black.opacity(0.2))
        .background(.ultraThinMaterial)
        .edgesIgnoringSafeArea(.all)
      VStack {
        Image(systemName: type == .success ? "checkmark.circle" : "xmark.circle")
          .resizable()
          .scaledToFit()
          .frame(width: 64)
          .foregroundColor(type == .success ? .accent : .red)
          .padding(.bottom, 10)
        Text(type == .success ? "Success!" : "Error!")
          .font(.title2)
          .fontWeight(.bold)
          .fontDesign(.rounded)
        Text(type == .success ? "New charging station created." : "There was an error...")
          .font(.subheadline)
          .fontDesign(.rounded)
      } //: VSTACK
      .padding(40)
      .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 15.0))
    } //: ZSTACK
    .onAppear {
      DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
        self.isShown.toggle()
        if type == .success { dismiss() }
      })
    }
  }
}

// MARK: - ENUM
enum StatusType {
  case success, error
}

// MARK: - PREVIEW
#Preview {
  @State var isShown = true
  return StatusDialog(isShown: $isShown, type: .success)
}
