//
//  JSONReader.swift
//  PoringKit
//
//  Created by Rawipon Srivibha on 15/5/18.
//

import Foundation

class JSONReader {
  
  static func open(_ fileName: String, bundle: Bundle = Bundle.main) throws -> Data {
    guard
      let url = bundle.url(forResource: fileName, withExtension: "json")
      else {
        assertionFailure("PoringKit: Cannot find \(fileName)")
        return Data()
    }
    
    return try Data(contentsOf: url)
  }
  
  static func convert(_ json: Data) throws -> Any {
    let option = JSONSerialization.ReadingOptions.mutableContainers
    return try JSONSerialization.jsonObject(with: json, options: option)
  }
  
  static func convert(_ json: String) throws -> Any {
    guard let jsonData = json.data(using: .utf8, allowLossyConversion: false) else {
      assertionFailure("PoringKit: Cannot convert JSON file")
      return Data()
    }
    
    let option = JSONSerialization.ReadingOptions.mutableContainers
    return try JSONSerialization.jsonObject(with: jsonData, options: option)
  }
  
}
