//
//  ChargingStation.swift
//  ChargingStation
//
//  Created by Filip Kisić on 05.01.2024..
//

import Foundation

struct ChargingStation: Identifiable, Codable {
  let id: Int?
  let imageBytes: String
  let title: String
  let address: String
  let latitude: Double
  let longitude: Double
  let parkingSpots: [ParkingSpot]
  let hasFreeSpots: Bool
}
