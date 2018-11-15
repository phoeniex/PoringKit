//
//  PoringStyleSheet+UIButton.swift
//  Pods
//
//  Created by Rawipon Srivibha on 8/16/17.
//
//

import Fashion
import UIKit

extension PoringStyleSheet {
  
  func applyButton(_ style: PoringStyle, for styleName: String) {
    register(styleName) { ( button: UIButton ) in
      button.apply(style)
    }
  }
  
  func applyShareButton(_ style: PoringStyle) {
    share { ( button: UIButton ) in
      button.apply(style)
    }
  }
  
  func applyShareBarButton(_ style: PoringStyle) {
    shareAppearance { ( button: UIBarButtonItem ) in
      button.apply(style)
    }
  }
  
}

extension UIButton {
  
  func buttonBackgroundImageWithColor(_ color: UIColor) -> UIImage {
    let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
    UIGraphicsBeginImageContext(rect.size)
    let context = UIGraphicsGetCurrentContext()
    context?.setFillColor(color.cgColor)
    context?.fill(rect)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image!
  }
  
  func apply(_ style: PoringStyle) {
    if let fontColor = style.fontColor {
      setTitleColor(fontColor, for: .normal)
    }
    
    if let fontColor = style.fontColorHighlighted {
      setTitleColor(fontColor, for: .highlighted)
    }
    
    if let fontColor = style.fontColorSelected {
      setTitleColor(fontColor, for: .selected)
    }
    
    if let fontColor = style.fontColorDisabled {
      setTitleColor(fontColor, for: .disabled)
    }

    if let titleLabel = self.titleLabel {
      titleLabel.textAlignment =? style.textAlignment
      
      if let styleFont = PoringStyleSheet.font(style: style, defaultFont: titleLabel.font) {
        titleLabel.font = styleFont
      }
    }
    
    if let backgroundColor = style.backgroundColorDisabled {
      let imageColor = buttonBackgroundImageWithColor(backgroundColor)
      setBackgroundImage(imageColor, for: .disabled)
    }
    
    if let backgroundColor = style.backgroundColorSelected {
      let imageColor = buttonBackgroundImageWithColor(backgroundColor)
      setBackgroundImage(imageColor, for: .selected)
    }
  }
  
}

extension UIBarButtonItem {

  func apply(_ style: PoringStyle) {
    applyTextAttribute(style, for: .normal)
    
    tintColor =? style.tintColor
  }
  
  private func applyTextAttribute(_ style: PoringStyle, for state: UIControl.State) {
    var styledTextAttribute: [NSAttributedString.Key: Any] = [:]
    var defaultFont: UIFont? = nil
    
    if let nonNilTitleTextAttributes = titleTextAttributes(for: .normal) {
      nonNilTitleTextAttributes.forEach {
        styledTextAttribute[$0] = $1
      }
      
      defaultFont = nonNilTitleTextAttributes[.font] as? UIFont
    }
  
    var fontColor: UIColor?
    var font: UIFont?
    
    switch state {
    case .normal:
      fontColor = style.fontColor
      font = PoringStyleSheet.font(style: style,
                                   defaultFont: defaultFont)
    case .selected:
      fontColor = style.fontColorSelected
      font = PoringStyleSheet.font(style: style,
                                   defaultFont: defaultFont)
    case .disabled:
      fontColor = style.fontColorDisabled
      font = PoringStyleSheet.font(style: style,
                                   defaultFont: defaultFont)
    case .highlighted:
      fontColor = style.fontColorHighlighted
      font = PoringStyleSheet.font(style: style,
                                   defaultFont: defaultFont)
    default: break
    }
    
    styledTextAttribute[.foregroundColor] =? fontColor
    styledTextAttribute[.font] =? font
    
    setTitleTextAttributes(styledTextAttribute, for: state)
  }

}

