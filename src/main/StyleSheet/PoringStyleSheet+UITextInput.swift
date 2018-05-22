//
//  PoringStyleSheet+UITextInput.swift
//  Pods
//
//  Created by Rawipon Srivibha on 8/17/17.
//
//

import Fashion
import UIKit

extension PoringStyleSheet {
  
  func applyTextField(_ style: PoringStyle, for styleName: String) {
    register(styleName) { ( textField: UITextField ) in
      textField.apply(style)
    }
  }

  func applyShareTextField(_ style: PoringStyle) {
    share { ( textField: UITextField ) in
      textField.apply(style)
    }
  }
  
  func applyTextView(_ style: PoringStyle, for styleName: String) {
    register(styleName) { ( textView: UITextView ) in
      textView.apply(style)
    }
  }

  func applyShareTextView(_ style: PoringStyle) {
    share { ( textView: UITextView ) in
      textView.apply(style)
    }
  }
  
}

extension UITextField {

  func apply(_ style: PoringStyle) {
    alpha =? style.opacity?.cgFloat
    backgroundColor =? style.backgroundColor
    layer.cornerRadius =? style.borderRadius?.cgFloat
    layer.borderWidth =? style.borderWidth?.cgFloat
    layer.borderColor =? style.borderColor?.cgColor
    tintColor =? style.tintColor
    
    textColor =? style.fontColor
    textAlignment =? style.textAlignment
    keyboardType =? style.keyboardType
    borderStyle =? style.borderStyle
    
    if let styleFont = PoringStyleSheet.font(style: style, defaultFont: font) {
      font = styleFont
    }
  }

}

extension UITextView {
  
  func apply(_ style: PoringStyle) {
    alpha =? style.opacity?.cgFloat
    backgroundColor =? style.backgroundColor
    layer.cornerRadius =? style.borderRadius?.cgFloat
    layer.borderWidth =? style.borderWidth?.cgFloat
    layer.borderColor =? style.borderColor?.cgColor
    tintColor =? style.tintColor

    textColor =? style.fontColor
    textAlignment =? style.textAlignment
    keyboardType =? style.keyboardType

    if let styleFont = PoringStyleSheet.font(style: style, defaultFont: font) {
      font = styleFont
    }
  }
  
}
