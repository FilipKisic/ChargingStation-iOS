//
//  NumbersOnlyViewModifier.swift
//  ChargingStation
//
//  Created by Filip Kisić on 19.01.2024..
//

import SwiftUI
import Combine

struct NumbersOnlyViewModifier: ViewModifier {
  
  @Binding var text: String
  var isDecimal: Bool
  
  func body(content: Content) -> some View {
    content
      .keyboardType(isDecimal ? .numbersAndPunctuation : .numberPad)
      .onReceive(Just(text), perform: { newValue in
        var numbers = "-0123456789"
        let decimalSeparator = Locale.current.decimalSeparator ?? "."
        
        if isDecimal {
          numbers += decimalSeparator
        }
        
        if breaksRuleOfSingleCharacter(newValue, decimalSeparator) || breaksRuleOfSingleCharacter(newValue, "-") {
          let filtered = newValue
          self.text = String(filtered.dropLast())
        } else {
          let filtered = newValue.filter { numbers.contains($0) }
          if filtered != newValue {
            self.text = filtered
          }
        }
      })
  }
  
  private func breaksRuleOfSingleCharacter(_ value: String, _ character: String) -> Bool{
    return value.components(separatedBy: character).count - 1 > 1
  }
}

extension View {
  func numbersOnly(_ text: Binding<String>, isDecimal: Bool = false) -> some View {
    self.modifier(NumbersOnlyViewModifier(text: text, isDecimal: isDecimal))
  }
}
