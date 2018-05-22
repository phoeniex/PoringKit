//
//  PoringStyleSheet+UILabel.swift
//  Pods
//
//  Created by Rawipon Srivibha on 8/17/17.
//
//

import Fashion
import UIKit

extension PoringStyleSheet {
  
  func applyLabel(_ style: PoringStyle, for styleName: String) {
    register(styleName) { ( label: UILabel ) in
      label.apply(style)
    }
  }

  func applyShareLabel(_ style: PoringStyle) {
    share { ( label: UILabel ) in
      label.apply(style)
    }
  }
  
}

extension UILabel {
  
  func apply(_ style: PoringStyle) {
    alpha =? style.opacity?.cgFloat
    backgroundColor =? style.backgroundColor
    layer.cornerRadius =? style.borderRadius?.cgFloat
    layer.borderWidth =? style.borderWidth?.cgFloat
    layer.borderColor =? style.borderColor?.cgColor
    tintColor =? style.tintColor
    
    textColor =? style.fontColor
    textAlignment =? style.textAlignment
    
    if let styleFont = PoringStyleSheet.font(style: style, defaultFont: font) {
      font = styleFont
    }
  }
  
}
