//
//  PoringStyleSheet+UITableView.swift
//  Pods
//
//  Created by Rawipon Srivibha on 8/22/17.
//
//

import Fashion
import UIKit

extension PoringStyleSheet {

  func applyTableView(_ style: PoringStyle, for styleName: String) {
    register(styleName) { ( tableView: UITableView ) in
      tableView.apply(style)
    }
  }

  func applyShareTableView(_ style: PoringStyle) {
    share { (tableView: UITableView) in
      tableView.apply(style)
    }
  }

  func applyCollectionView(_ style: PoringStyle, for styleName: String) {
    register(styleName) { ( collectionView: UICollectionView ) in
      collectionView.apply(style)
    }
  }

  func applyShareCollectionView(_ style: PoringStyle) {
    share { (collectionView: UICollectionView) in
      collectionView.apply(style)
    }
  }

}

extension UITableView {

  func apply(_ style: PoringStyle) {
    applyToView(style)
    separatorColor =? style.separatorColor
  }

}

extension UICollectionView {

  func apply(_ style: PoringStyle) {
    applyToView(style)
  }

}
