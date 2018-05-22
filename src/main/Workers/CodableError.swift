//
//  CodableError.swift
//  AllianzUIKit
//
//  Created by Rawipon Srivibha on 20/2/18.
//

import Foundation

public enum CodableError: Error, LocalizedError {
  case cannotConvertObject(type: String, value: String)
  
  public var errorDescription: String? {
    switch self {
    case .cannotConvertObject(let type, let value):
      return "Cannot convert \"\(value)\" for \"\(type)\""
    }
  }
}
