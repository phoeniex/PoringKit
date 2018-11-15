//
//  PoringStyleSheet+UIBar.swift
//  Pods
//
//  Created by Rawipon Srivibha on 8/22/17.
//
//

import Fashion
import UIKit

extension PoringStyleSheet {

  func applyShareNavigationBar(_ style: PoringStyle) {
    share { (navigationBar: UINavigationBar) in
      navigationBar.apply(style)
    }
  }

  func applyShareToolbar(_ style: PoringStyle) {
    share { (toolBar: UIToolbar) in
      toolBar.apply(style)
    }
  }

}

extension UINavigationBar {

  func apply(_ style: PoringStyle) {
    applyToView(style)
    applyTitleTextAttribute(style)
    
    if #available(iOS 11.0, *) {
      applyLargeTitleTextAttribute(style)
    }
    
    barTintColor =? style.barTintColor
    isTranslucent =? style.translucentBar
  }
  
  func applyTitleTextAttribute(_ style: PoringStyle) {
    var styledTextAttribute: [NSAttributedString.Key: Any] = [:]
    var defaultFont: UIFont? = nil
    
    if let nonNilTitleTextAttributes = titleTextAttributes {
      styledTextAttribute = nonNilTitleTextAttributes
      defaultFont = nonNilTitleTextAttributes[.font] as? UIFont
    }
    
    styledTextAttribute[.foregroundColor] =? style.fontColor
    if let styleFont = PoringStyleSheet.font(style: style,
                                             defaultFont: defaultFont) {
      styledTextAttribute[.font] = styleFont
    }

    titleTextAttributes = styledTextAttribute
  }
  
  @available(iOS 11.0, *)
  func applyLargeTitleTextAttribute(_ style: PoringStyle) {
    var largeStyledTextAttribute: [NSAttributedString.Key: Any] = [:]
    var defaultLargeFont: UIFont? = nil
    
    if let nonNilTitleTextAttributes = largeTitleTextAttributes {
      largeStyledTextAttribute = nonNilTitleTextAttributes
      defaultLargeFont = nonNilTitleTextAttributes[.font] as? UIFont
    }
    
    largeStyledTextAttribute[.foregroundColor] =? style.fontColor
    if let styleFont = PoringStyleSheet.font(family: style.fontFamily,
                                             style: style.fontStyle,
                                             size: style.largeFontSize,
                                             defaultFont: defaultLargeFont) {
      largeStyledTextAttribute[.font] = styleFont
    }
    
    largeTitleTextAttributes = largeStyledTextAttribute
  }

}

extension UIToolbar {

  func apply(_ style: PoringStyle) {
    applyToView(style)
    barTintColor =? style.barTintColor
    isTranslucent =? style.translucentBar
  }

}
