//
//  UITextBorderStyle+Codable.swift
//  Pods
//
//  Created by Rawipon Srivibha on 21/12/17.
//

import Foundation

extension UITextField.BorderStyle: Decodable {
  
  public init(from decoder: Decoder) throws {
    let value = try decoder.singleValueContainer().decode(String.self).lowercased()
    
    switch value {
    case "rounded_rect": self = .roundedRect
    case "none": self = .none
    case "line": self = .line
    case "bezel": self = .bezel
    default: throw PoringKitError.cannotConvertObject(type: String(describing: UITextField.BorderStyle.self), value: value)
    }
  }
  
}
