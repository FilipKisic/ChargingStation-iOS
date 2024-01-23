//
//  ValidationUtils.swift
//  ChargingStation
//
//  Created by Filip Kisić on 23.01.2024..
//

import Foundation

func validateTitle() {
  if title.isEmpty {
    titleError = "Title must not be empty."
  } else {
    titleError = ""
  }
}

func validateAddress() {
  if address.isEmpty {
    addressError = "Address must not be empty."
  } else {
    addressError = ""
  }
}
