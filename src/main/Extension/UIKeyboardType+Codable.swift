//
//  UIKeyboard+Codable.swift
//  AllianzFoundation
//
//  Created by Rawipon Srivibha on 21/12/17.
//

import UIKit

extension UIKeyboardType: Decodable {
  
  // swiftlint:disable cyclomatic_complexity
  public init(from decoder: Decoder) throws {
    let value = try decoder.singleValueContainer().decode(String.self).lowercased()
    
    switch value {
    case "default": self = .default
    case "ascii_capable": self = .asciiCapable
    case "numbers_and_punctuation": self = .numbersAndPunctuation
    case "url": self = .URL
    case "number_pad": self = .numberPad
    case "phone_pad": self = .phonePad
    case "email_address": self = .emailAddress
    case "decimal_pad": self = .decimalPad
    case "twitter": self = .twitter
    case "web_search": self = .webSearch
    case "ascii_capable_number_pad":
      if #available(iOS 10.0, *) {
        self = .asciiCapableNumberPad
      } else {
        self = .numberPad
      }
    default: throw PoringKitError.cannotConvertObject(type: String(describing: UIKeyboardType.self), value: value)
    }
  }
  
}
