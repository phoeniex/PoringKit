//
//  PoringKit.swift
//  Pods
//
//  Created by Rawipon Srivibha on 6/26/17.
//
//

import Foundation

import Fashion

public enum PoringKitError: Error, LocalizedError {
  case themeNotFound(fileName: String)
  case cannotConvertJson
  case cannotConvertObject(type: String, value: String)
  
  public var errorDescription: String? {
    switch self {
    case .themeNotFound(let fileName):
      return "Cannot apply theme. Please make sure \(fileName) is exist."
    case .cannotConvertJson:
      return "Cannot convert json dictionary to data"
    case .cannotConvertObject(let type, let value):
      return "Cannot convert \"\(value)\" for \"\(type)\""
    }
  }
}

public class PoringKit {
  
  public static func startStyle(_ fileName: String, bundle: Bundle = Bundle.main) {
    guard let url = bundle.url(forResource: fileName, withExtension: nil) else {
      print(PoringKitError.themeNotFound(fileName: fileName).localizedDescription)
      return
    }
    
    Fashion.register(stylesheets: [PoringStyleSheet(fileURL: url, isLive: false)])
  }
  
  public static func startLiveStyle(_ filePath: String) {
    let url = URL(fileURLWithPath: filePath)
    Fashion.register(stylesheets: [PoringStyleSheet(fileURL: url, isLive: true)])
  }
  
}

