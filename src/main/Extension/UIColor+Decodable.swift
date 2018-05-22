//
//  UIColor+Decodable.swift
//  Pods
//
//  Created by Rawipon Srivibha on 20/2/18.
//

import UIKit

public final class DecodableColor: UIColor, Decodable {
  public required convenience init(from decoder: Decoder) throws {
    let value = try decoder.singleValueContainer().decode(String.self).lowercased()
    
    if let color = UIColor.predefinedColor(value) {
      self.init(cgColor: color.cgColor)
    } else if let color = UIColor.hexColor(value) {
      self.init(cgColor: color.cgColor)
    } else {
      throw CodableError.cannotConvertObject(type: String(describing: UIColor.self), value: value)
    }
  }
}

extension UIColor {
  
  // "red": predefined color
  // swiftlint:disable cyclomatic_complexity
  fileprivate static func predefinedColor(_ string: String) -> UIColor? {
    switch string {
    case "red": return .red
    case "green": return .green
    case "blue": return .blue
    case "clear": return .clear
    case "black": return .black
    case "white": return .white
    case "brown": return .brown
    case "cyan": return .cyan
    case "dark_gray": return .darkGray
    case "gray": return .gray
    case "light_gray": return .lightGray
    case "magenta": return .magenta
    case "orange": return .orange
    case "purple": return .purple
    case "yellow": return .yellow
    default: return nil
    }
  }
  
  // --- Duplicate from UIKit. to avoid cyclic dependency
  
  fileprivate static func hexColor(_ string: String) -> UIColor? {
    if string.hasPrefix("#") {
      let start = string.index(string.startIndex, offsetBy: 1)
      let hexColor = String(string[start...])
      var hexNumber: UInt32 = 0
      let scanner = Scanner(string: hexColor)
      
      guard scanner.scanHexInt32(&hexNumber) else {
        return nil
      }
      
      switch hexColor.count {
      case 8: return fullHexRGBA(hexNumber: hexNumber)
      case 6: return fullHexRGB(hexNumber: hexNumber)
      case 4: return shortHexRGBA(hexNumber: UInt16(hexNumber))
      case 3: return shortHexRGB(hexNumber: UInt16(hexNumber))
      default: return nil
      }
    }
    
    return nil
  }
    
  fileprivate static func fullHexRGBA(hexNumber: UInt32) -> UIColor {
    let divisor = CGFloat(255)
    let red     = CGFloat((hexNumber & 0xFF000000) >> 24) / divisor
    let green   = CGFloat((hexNumber & 0x00FF0000) >> 16) / divisor
    let blue    = CGFloat((hexNumber & 0x0000FF00) >>  8) / divisor
    let alpha   = CGFloat( hexNumber & 0x000000FF       ) / divisor
    return UIColor(red: red, green: green, blue: blue, alpha: alpha)
  }
  
  fileprivate static func fullHexRGB(hexNumber: UInt32) -> UIColor {
    let divisor = CGFloat(255)
    let red     = CGFloat((hexNumber & 0xFF0000) >> 16) / divisor
    let green   = CGFloat((hexNumber & 0x00FF00) >>  8) / divisor
    let blue    = CGFloat((hexNumber & 0x0000FF)      ) / divisor
    let alpha   = CGFloat(1.0)
    return UIColor(red: red, green: green, blue: blue, alpha: alpha)
  }
  
  fileprivate static func shortHexRGBA(hexNumber: UInt16) -> UIColor {
    let divisor = CGFloat(15)
    let red     = CGFloat((hexNumber & 0xF000) >> 12) / divisor
    let green   = CGFloat((hexNumber & 0x0F00) >>  8) / divisor
    let blue    = CGFloat((hexNumber & 0x00F0) >>  4) / divisor
    let alpha   = CGFloat( hexNumber & 0x000F       ) / divisor
    return UIColor(red: red, green: green, blue: blue, alpha: alpha)
  }
  
  fileprivate static func shortHexRGB(hexNumber: UInt16) -> UIColor {
    let divisor = CGFloat(15)
    let red     = CGFloat((hexNumber & 0xF00) >> 8) / divisor
    let green   = CGFloat((hexNumber & 0x0F0) >> 4) / divisor
    let blue    = CGFloat( hexNumber & 0x00F      ) / divisor
    let alpha   = CGFloat(1.0)
    return UIColor(red: red, green: green, blue: blue, alpha: alpha)
  }
  
}
