//
//  SettingsScreenView.swift
//  ChargingStation
//
//  Created by Filip Kisić on 10.01.2024..
//

import SwiftUI

struct SettingsScreenView: View {
  // MARK: - BODY
  var body: some View {
    NavigationView {
      ZStack {
        Color.backgroundMain
          .edgesIgnoringSafeArea(.all)
        VStack {
          Image(.myProfile)
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .frame(width: 132)
            .padding(.top, 50)
            .padding(.bottom)
            .shadow(radius: 5, x: 0, y: 5)
          
          Text("Filip Kisić")
            .font(.title)
            .fontWeight(.bold)
            .fontDesign(.rounded)
          Text("Mobile application developer")
            .font(.footnote)
            .fontDesign(.rounded)
            .foregroundStyle(.secondary)
          
          Spacer()
          
          Text("Croatia🇭🇷")
          Text("Email: f.kisic@reply.de")
          Text("Phone: +385 98 1234 567")
          
          Spacer()
          
          Text("Comsysto Reply GmbH @ 2024")
            .padding(.bottom, 15)
        } //: VSTACK
        .navigationTitle("Settings")
      } //: ZSTACK
    } //: NAVIGATION VIEW
  }
}

// MARK: - PREVIEW
#Preview {
  SettingsScreenView()
}
