//
//  PoringStyle.swift
//  Pods
//
//  Created by Rawipon Srivibha on 8/16/17.
//
//

public struct PoringStyle: Decodable {
  
  enum CodingKeys: String, CodingKey {
    case opacity
    case backgroundColor = "background_color"
    case borderRadius = "corner_radius"
    case borderWidth = "border_width"
    case borderColor = "border_color"
    case tintColor = "tint_color"
    case fontFamily = "font_family"
    case fontStyle = "font_style"
    case fontSize = "font_size"
    case fontFamilySelected = "font_family_selected"
    case fontStyleSelected = "font_style_selected"
    case fontSizeSelected = "font_size_selected"
    case fontColor = "text_color"
    case textAlignment = "text_alignment"
    case backgroundColorDisabled = "background_color_disabled"
    case backgroundColorSelected = "background_color_selected"
    case backgroundColorHighlighted = "background_color_highlighted"
    case fontColorDisabled = "text_color_disabled"
    case fontColorSelected = "text_color_selected"
    case fontColorHighlighted = "text_color_highlight"
    case barTintColor = "bar_color"
    case translucentBar = "translucent"
    case largeFontSize = "large_font_size"
    case pageIndicatorTintColor = "color"
    case currentPageTintColor = "current_color"
    case activeTintColor = "active_color"
    case thumbTintColor = "thumb_color"
    case separatorColor = "separator_color"
    case keyboardType = "keyboard_type"
    case borderStyle = "border_style"
  }
  
  // UIView Properties
  var opacity: Double?
  var backgroundColor: DecodableColor?
  var borderRadius: Double?
  var borderWidth: Double?
  var borderColor: DecodableColor?
  var tintColor: DecodableColor?
  
  // Font Properties
  var fontFamily: String?
  var fontStyle: String?
  var fontColor: DecodableColor?
  var fontSize: Double?
  var textAlignment: NSTextAlignment?

  // UIButton / UIBarButton / UIBarButtonBack Properties
  var backgroundColorDisabled: DecodableColor?
  var backgroundColorSelected: DecodableColor?
  var backgroundColorHighlighted: DecodableColor?
  var fontColorDisabled: DecodableColor?
  var fontColorSelected: DecodableColor?
  var fontColorHighlighted: DecodableColor?
  var fontFamilySelected: String?
  var fontStyleSelected: String?
  var fontSizeSelected: Double?

  // UINavigationBar
  var barTintColor: DecodableColor?
  var translucentBar: Bool?
  var largeFontSize: Double?

  // UIPageControl
  var pageIndicatorTintColor: DecodableColor?
  var currentPageTintColor: DecodableColor?

  // UISwitch
  var activeTintColor: DecodableColor?
  var thumbTintColor: DecodableColor?

  // UITableView
  var separatorColor: DecodableColor?

  // UITextField / UITextView
  var keyboardType: UIKeyboardType?
  var borderStyle: UITextBorderStyle?
  
}
