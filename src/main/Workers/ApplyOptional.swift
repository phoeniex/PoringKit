//
//  ApplyOptional.swift
//  PoringKit
//
//  Created by Rawipon Srivibha on 15/5/18.
//

import Foundation

infix operator =?
func =? <Object>(lhs: inout Object, rhs: Object?) {
  guard let value = rhs as Any as? Object else { return }
  lhs = value
}
