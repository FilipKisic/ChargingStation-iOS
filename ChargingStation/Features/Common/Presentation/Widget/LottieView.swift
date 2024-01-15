//
//  LottieView.swift
//  ChargingStation
//
//  Created by Filip Kisić on 10.01.2024..
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
  let fileName: String
  var loopMode: LottieLoopMode = .loop
  
  func updateUIView(_ uiView: UIViewType, context: Context) {
    
  }
  
  func makeUIView(context: Context) -> some UIView {
    let view = UIView(frame: .zero)
    let animationView = LottieAnimationView(name: self.fileName)
    
    animationView.loopMode = self.loopMode
    animationView.contentMode = .scaleAspectFit
    animationView.play()
    animationView.translatesAutoresizingMaskIntoConstraints = false
    
    view.addSubview(animationView)
    
    NSLayoutConstraint.activate([
      animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
      animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
    ])
    
    return view
  }
}

#Preview {
  LottieView(fileName: "loading", loopMode: .loop)
    .frame(width: 200, height: 200)
}
