//
//  PoringStyleSheet+UISwitch.swift
//  Pods
//
// Created by Rawipon Srivibha on 8/22/17.
//

import Fashion
import UIKit

extension PoringStyleSheet {

  func applySwitch(_ style: PoringStyle, for styleName: String) {
    register(styleName) { ( uiSwitch: UISwitch ) in
      uiSwitch.apply(style)
    }
  }

  func applyShareSwitch(_ style: PoringStyle) {
    share { ( uiSwitch: UISwitch ) in
      uiSwitch.apply(style)
    }
  }

}

extension UISwitch {

  func apply(_ style: PoringStyle) {
    alpha =? style.opacity?.cgFloat
    onTintColor =? style.activeTintColor
    thumbTintColor =? style.thumbTintColor
  }

}

