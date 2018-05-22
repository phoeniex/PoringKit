//
//  PoringStyleSheet+UIImageView.swift
//  PoringKit
//
//  Created by Rawipon Srivibha on 27/12/17.
//

import Fashion
import UIKit

extension PoringStyleSheet {
  
  func applyImageView(_ style: PoringStyle, for styleName: String) {
    register(styleName) { ( view: UIImageView ) in
      view.apply(style)
    }
  }
  
  func applyShareImageView(_ style: PoringStyle) {
    share { ( view: UIImageView ) in
      view.apply(style)
    }
  }
  
}

extension UIImageView {
  
  func apply(_ style: PoringStyle) {
    applyToView(style)
  }
  
}


