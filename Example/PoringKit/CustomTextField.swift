//
//  CustomTextField.swift
//  PoringKit_Example
//
//  Created by Rawipon Srivibha on 11/1/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import PoringKit

struct CustomTextFieldPoringStyle: Codable {
  enum CodingKeys: CodingKey {
    case custom
  }
  
  var custom: String
}

class CustomTextField: UITextField, PoringStyleElement {
  
  func apply(_ styleData: Data) {
    if let style = try? JSONDecoder().decode(CustomTextFieldPoringStyle.self, from: styleData) {
      text = style.custom
    }
    
  }
  
}
