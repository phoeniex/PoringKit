//
//  UIApplication+Reload.swift
//  Pods
//
//  Created by Rawipon Srivibha on 8/21/17.
//
//

import Foundation
import Fashion

extension UIApplication {
  func reloadStyle() {
    windows.forEach {
      $0.reloadStyle()
    }
  }
}

extension UIView {
  func reloadStyle() {
    self.willMove(toSuperview: self.superview)
    if let styles = self.styles {
      self.styles = styles
    }
    
    subviews.forEach {
      $0.reloadStyle()
    }
  }
}
