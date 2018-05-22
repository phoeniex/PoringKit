//
//  NSTextAlignment+Codablr.swift
//  Pods
//
//  Created by Rawipon Srivibha on 21/12/17.
//

import Foundation

extension NSTextAlignment: Decodable {
  
  public init(from decoder: Decoder) throws {
    let value = try decoder.singleValueContainer().decode(String.self).lowercased()
    
    switch value {
    case "left": self = .left
    case "center": self = .center
    case "right": self = .right
    case "justified": self = .justified
    default: throw PoringKitError.cannotConvertObject(type: String(describing: NSTextAlignment.self), value: value)
    }
  }
  
}
