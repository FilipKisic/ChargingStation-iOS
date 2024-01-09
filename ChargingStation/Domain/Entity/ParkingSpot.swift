//
//  ParkingSpot.swift
//  ChargingStation
//
//  Created by Filip Kisić on 05.01.2024..
//

import Foundation

struct ParkingSpot: Codable {
  let quantity: Int
  let type: ChargerType
}

enum ChargerType: String, Codable {
  case type2_11kW = "TYPE_2_11kW"
  case type2_22kW = "TYPE_2_22kW"
  case ccs2_24kW = "CCS2_24kW"
}
