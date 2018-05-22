//
//  PoringStyleSheet.swift
//  Pods
//
//  Created by Rawipon Srivibha on 8/16/17.
//
//

import Foundation
import Fashion
import CryptoSwift

public protocol PoringStyleElement: UIAppearance {
  func apply(_ styleData: Data)
}

public struct PoringStyleSheet: Stylesheet {
  
  static var currentHex: String = ""
  static var fonts: [String: [String: String]] = [:]
  static var sharedFont: String?
  
  var fileURL: URL
  var isLive: Bool
  
  init(fileURL: URL, isLive: Bool) {
    self.fileURL = fileURL
    self.isLive = isLive
  }
  
  public func define() {
    if isLive {
      Timer.every(2.0.seconds) {
        guard self.isDirty() else { return }
        
        self.updateStyle()
        UIApplication.shared.reloadStyle()
      }
    }
    
    isDirty()
    updateStyle()
  }
  
  @discardableResult func isDirty() -> Bool {
    guard let data = try? Data(contentsOf: fileURL) else { return false }
    let hex = data.md5().toHexString()
    guard hex != PoringStyleSheet.currentHex.md5() else { return false }
    PoringStyleSheet.currentHex = hex
    return true
  }
  
  func updateStyle() {
    do {
      let jsonData = try Data(contentsOf: fileURL)
      guard var json = try JSONReader.convert(jsonData) as? [String: [String: Any]] else {
        return
      }
     
      var variables: [String: Any] = [:]
      if let variableJSON = json.removeValue(forKey: "constants") {
        for (variableName, variableValue) in variableJSON {
          variables[variableName] = variableValue
        }
      }
      
      if let fontFamilyJSON = json.removeValue(forKey: "fonts") {
        for (fontFamily, fontValue) in fontFamilyJSON {
          guard let fontValue = fontValue as? [String: String] else { continue }
          PoringStyleSheet.fonts[fontFamily] = [:]
          for (fontStyle, fontName) in fontValue {
            PoringStyleSheet.fonts[fontFamily]?[fontStyle] = fontName
          }
        }
      }

      if let value = json.removeValue(forKey: "shared") {
        applySharedFont(value)
        applySharedStyle(value, with: variables)
      }
      
      // Other Element Style
      for (key, value) in json {
        do {
          let appliedValue = applyVariable(variables, to: value)
          let appliedData = try JSONSerialization.data(withJSONObject: appliedValue, options: .prettyPrinted)
          let decoder = JSONDecoder()
          let style = try decoder.decode(PoringStyle.self, from: appliedData)
          
          // Apply JSON Data into style
          unregister(key)
          applyView(style, for: key)
          applyImageView(style, for: key)
          applyButton(style, for: key)
          applyLabel(style, for: key)
          applyTextField(style, for: key)
          applyTextView(style, for: key)
          applyTableView(style, for: key)
          applyCollectionView(style, for: key)
          applyPageControl(style, for: key)
          applySwitch(style, for: key)
          applySegmentedControl(style, for: key)
          
          applyCustomElement(appliedData, for: key)
        } catch {
          print (error.localizedDescription)
        }
      }
    } catch {
      print (PoringKitError.cannotConvertJson.localizedDescription)
    }
  }
  
  // swiftlint:disable cyclomatic_complexity
  func applySharedStyle(_ json: [String: Any], with variables: [String: Any]) {
    for (key, value) in json {
      guard let styleJSON = value as? [String: Any] else {
        continue
      }
      
      do {
        let appliedValue = applyVariable(variables, to: styleJSON)
        let decoder = JSONDecoder()
        let appliedData = try JSONSerialization.data(withJSONObject: appliedValue, options: .prettyPrinted)
        let style = try decoder.decode(PoringStyle.self, from: appliedData)
        
        switch key.lowercased() {
        case "view": applyShareView(style)
        case "button": applyShareButton(style)
        case "bar_button": applyShareBarButton(style)
        case "image_view": applyShareImageView(style)
        case "label": applyShareLabel(style)
        case "text_field": applyShareTextField(style)
        case "text_view": applyShareTextView(style)
        case "segmented_control": applyShareSegmentedControl(style)
        case "navigation_bar": applyShareNavigationBar(style)
        case "toolbar": applyShareToolbar(style)
        case "switch": applyShareSwitch(style)
        case "page_control": applySharePageControl(style)
        case "table_view": applyShareTableView(style)
        case "collection_view": applyShareCollectionView(style)
        default: break
        }
      } catch {
        print (error.localizedDescription)
      }
    }
  }
  
  func applySharedFont(_ json: [String: Any]) {
    PoringStyleSheet.sharedFont = json["font_family"] as? String
  }
  
  func applyVariable(_ variables: [String: Any], to json: [String: Any]) -> [String: Any] {
    var appliedJSON: [String: Any] = [:]
    for (key, value) in json {
      appliedJSON[key] = value
      guard var stringValue = value as? String else { continue }
      
      // Have variable symbol?, apply correct value
      guard stringValue.contains("$") else { continue }
      
      stringValue.remove(at: stringValue.startIndex)
      appliedJSON[key] = variables[stringValue]
    }
    
    return appliedJSON
  }
  
  func applyCustomElement(_ styleData: Data, for styleName: String) {
    register(styleName) { ( view: UIView ) in
      (view as? PoringStyleElement)?.apply(styleData)
    }
  }
  
  static func font(style: PoringStyle,
                   defaultFont: UIFont?) -> UIFont? {
    return font(family: style.fontFamily,
                style: style.fontStyle,
                size: style.fontSize,
                defaultFont: defaultFont)
  }

  static func font(family: String?,
                   style: String?,
                   size: Double?,
                   defaultFont: UIFont?) -> UIFont? {
    // return nil, if nothing is set
    guard family != nil ||
          style != nil ||
          size != nil else {
      return nil
    }
    
    // Check font style
    let fontStyle = style ?? defaultFont?.poringStyle ?? "regular"
    
    // Check font size
    let fontSize = size?.cgFloat ?? defaultFont?.pointSize ?? UIFont.systemFontSize
    
    // In case of system font family
    if family?.lowercased() == "system" {
      return systemFont(style: fontStyle, size: fontSize)
    }
    
    // Otherwise, Check font family
    let familyName = family ?? ""
    let fontName = fonts[familyName]?[fontStyle] ?? defaultFont?.familyName
    guard let name = fontName,
          let font = UIFont(name: name, size: fontSize) else {
      return systemFont(style: fontStyle, size: fontSize)
    }
    
    font.poringStyle = fontStyle
    return font
  }
  
  private static func systemFont(style: String, size: CGFloat) -> UIFont? {
    let style = style.lowercased()
    var font: UIFont? = nil
    switch style {
    case "regular": font = UIFont.systemFont(ofSize: size)
    case "bold": font = UIFont.boldSystemFont(ofSize: size)
    case "italic": font = UIFont.italicSystemFont(ofSize: size)
    case "black": font = UIFont.systemFont(ofSize: size, weight: .black)
    case "heavy": font = UIFont.systemFont(ofSize: size, weight: .heavy)
    case "light": font = UIFont.systemFont(ofSize: size, weight: .light)
    case "medium": font = UIFont.systemFont(ofSize: size, weight: .medium)
    case "semibold": font = UIFont.systemFont(ofSize: size, weight: .semibold)
    case "ultra_light": font = UIFont.systemFont(ofSize: size, weight: .ultraLight)
    default: return nil
    }
    
    font?.poringStyle = style
    return font
  }
  
}

extension UIFont {
  
  fileprivate struct AssociatedKeys {
    static var style = "poring_font_style_associated_key"
  }
  
  fileprivate var poringStyle: String? {
    get {
      return objc_getAssociatedObject(self, &AssociatedKeys.style) as? String
    }
    set {
      objc_setAssociatedObject(self,
                               &AssociatedKeys.style,
                               newValue,
                               objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
  }
  
}
