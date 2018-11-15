//
//  PoringStyleSheet+UISegmentedControl.swift
//  Pods
//
//  Created by Rawipon Srivibha on 8/22/17.
//
//

import Fashion
import UIKit

extension PoringStyleSheet {
  
  func applySegmentedControl(_ style: PoringStyle, for styleName: String) {
    register(styleName) { (segmentedControl: UISegmentedControl ) in
      segmentedControl.apply(style)
    }
  }
  
  func applyShareSegmentedControl(_ style: PoringStyle) {
    share { (segmentedControl: UISegmentedControl) in
      segmentedControl.apply(style)
    }
  }
  
}

extension UISegmentedControl {

  func apply(_ style: PoringStyle) {
    applyToView(style)
    
    var normalAttrs = titleTextAttributes(for: .normal) ?? [:]
    var selectedAttrs = titleTextAttributes(for: .selected) ?? [:]
    let systemFont = UIFont.systemFont(ofSize: UIFont.systemFontSize)
    let defaultFont = normalAttrs[.font] as? UIFont ?? systemFont
    
    // Normal Attribute
    if let font = PoringStyleSheet.font(style: style, defaultFont: defaultFont) {
      normalAttrs[.font] = font
    }
    
    normalAttrs[.foregroundColor] =? style.fontColor
    normalAttrs[.backgroundColor] =? style.backgroundColor
    
    // Apply Attribute if Custom Something
    if !normalAttrs.isEmpty {
      set(normalAttrs, for: .normal)
    }
    
    // Selected Attribute
    if let fontSelected = PoringStyleSheet.font(family: style.fontFamilySelected,
                                             style: style.fontStyleSelected,
                                             size: style.fontSizeSelected,
                                             defaultFont: defaultFont) {
      selectedAttrs[.font] = fontSelected
    }
    
    selectedAttrs[.foregroundColor] =? style.fontColorSelected
    selectedAttrs[.backgroundColor] =? style.backgroundColorSelected
    
    // Apply Attribute if Custom Something
    if !selectedAttrs.isEmpty {
      set(selectedAttrs, for: .selected)
    }
  }
  
  func set(_ attributes: [NSAttributedString.Key: Any] = [:], for state: UIControl.State = .normal) {
    setTitleTextAttributes(attributes, for: state)
    
    if let backgroundColor = attributes[.backgroundColor] as? UIColor {
      let backgroundImage = segmentBackgroundImageWithColor(backgroundColor)
      setBackgroundImage(backgroundImage, for: state, barMetrics: .default)
    }
  }
  
  public func segmentBackgroundImageWithColor(_ color: UIColor) -> UIImage {
    let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
    UIGraphicsBeginImageContext(rect.size)
    let context = UIGraphicsGetCurrentContext()
    context?.setFillColor(color.cgColor)
    context?.fill(rect)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image!
  }

}
