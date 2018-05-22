//
//  PoringStyleSheet+UIPageControl.swift
//  Pods
//
//  Created by Rawipon Srivibha on 8/22/17.
//
//

import Fashion
import UIKit

extension PoringStyleSheet {

  func applyPageControl(_ style: PoringStyle, for styleName: String) {
    register(styleName) { (pageControl: UIPageControl) in
      pageControl.apply(style)
    }
  }

  func applySharePageControl(_ style: PoringStyle) {
    share { (pageControl: UIPageControl) in
      pageControl.apply(style)
    }
  }

}

extension UIPageControl {

  func apply(_ style: PoringStyle) {
    alpha =? style.opacity?.cgFloat
    pageIndicatorTintColor =? style.pageIndicatorTintColor
    currentPageIndicatorTintColor =? style.currentPageTintColor
  }

}
