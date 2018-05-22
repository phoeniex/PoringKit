//
//  PoringStyleSheet+UIView.swift
//  Pods
//
//  Created by Rawipon Srivibha on 8/16/17.
//
//

import Fashion
import UIKit

extension PoringStyleSheet {
  
  func applyView(_ style: PoringStyle, for styleName: String) {
    register(styleName) { ( view: UIView ) in
      view.applyToView(style)
    }
  }
  
  func applyShareView(_ style: PoringStyle) {
    share { ( view: UIView ) in
      view.applyToView(style)
    }
  }
  
}

extension UIView {

  func applyToView(_ style: PoringStyle) {
    alpha =? style.opacity?.cgFloat
    backgroundColor =? style.backgroundColor
    layer.cornerRadius =? style.borderRadius?.cgFloat
    layer.borderWidth =? style.borderWidth?.cgFloat
    layer.borderColor =? style.borderColor?.cgColor
    tintColor =? style.tintColor
  }

}


