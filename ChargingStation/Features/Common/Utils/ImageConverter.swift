//
//  ImageConverter.swift
//  ChargingStation
//
//  Created by Filip Kisić on 16.01.2024..
//

import Foundation
import UIKit

class ImageConverter {
  static func base64ToImage(_ base64Image: String) -> UIImage? {
    guard let imageData = Data(base64Encoded: base64Image) else { return nil }
    return UIImage(data: imageData)
  }
}
