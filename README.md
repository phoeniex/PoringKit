# PoringKit

**PoringKit** is a style sheet management for read ashionUI style directly from JSON. Based on [Fashion](https://github.com/vadymmarkov/Fashion).

## Installation

**PoringKit** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "PoringKit"
```

## Usage

To start using **PoringKit** you need to start load file name by call:

```swift
PoringKit.startStyle("ui.json") // if file is in main bundle
PoringKit.startStyle("ui.json", bundle: bundle) // if file is in specific bundle
```

One more interesting feature. **PoringKit** provide live update in simulator for development phase. to quick adjust ui style. by update JSON file and save. It will manage and update in simulator right on time. No need to rebuild project again. to start doing this, Load **PoringKit** by using fullpath of JSON file by call:

```swift
PoringKit.startLiveStyle("/Users/Awesome/PoringKit/ui.json")
```

**PoringKit** Support JSON formation to customize ui elements. Using key to specific group of elements (called 'style').

Here the example of JSON style sheet:

```json
{
  "title_text": {
    "font_family": "avanir",
    "font_size": 22,
    "text_color": "dark_gray"
  },
  "allianz_tint": {
    "tint_color": "dark_gray"
  }
}
```

In this code element that define style as "title_text" will be set font name, font size and text color, and element that define style as "allianz_tint" will be set tint_color

#### Style

To define style in element, You can define via *storyboard* or define directly in code:

```swift
button.styles = "primary_button"
```

You can also define multiple style in one element. Using space to separate each style.

#### Fonts

To use font in JSON. You need to define font value in *fonts* dictionary,

``` swift
{
  "fonts": {
    "avenir": {
      "regular": "AvenirNext-Regular",
      "bold": "AvenirNext-Bold",
    }
  }
}
```

From example. This JSON will know *avenir* font family with 2 font styles (*regular* and *bold*). After define fonts family in *fonts* dictionary. You can use font family and font style to apply in each elements.

``` swift
{
  "primary_button": {
    "background_color": "white",
    "text_color": "#1092A8",
    "font_family": "avenir",
    "font_style": "bold",
    "font_size": 16
  }
}
```

This will apply *AvenirNext-Bold* in to *primary_button* style.

In case of *font_style* not define with *font_family* in element. It will use *regular* style in *font_family* instead. You can use default font family by define *system* and use following *font_style*:

- regular
- bold
- italic
- black
- heavy
- light
- medium
- semibold
- ultra\_light

#### Share Style

Share style is a style for all of elements that inherit from specific type. For example, If you want all buttons have same font name. Define font name property in shared style button.

Here, **PoringKit** have some of element to support in list below:

- view
- button
- label
- image_view
- text\_field
- text\_view
- segmented\_control
- navigation\_bar
- tool\_bar
- switch
- page\_control
- table\_view
- collection\_view

Otherwise **PoringKit** provide you a shared property to apply all of style sheets

**PoringKit** have some of property to support in list below:

- font_family

Use to set font family to defined style, Example for using shared style sheet:

``` swift
{
  "shared": {
    "font_family": "avenir",
    "button": {
      "background_color": "white"
    }
  },
  "primary_button": {
    "border_color": "#0155C8",
    "border_radius": 1
  }
}
```

According to example above, All of button element will have white background color, And element that define style as *primary_button* will have *avenir* font family.

#### Variable

Some style need to be configure by using the same value. You can using variable to apply any duplicate value, For doing this you need to define variable name and value in *constants* dictionary. Then, instead of using direct value. You can use variable name by start with '$' (Dollar Sign). Example below:

```json
{
  "constants": {
    "marin": "#0157C3"
  },
  "monster_title": {
    "tint_color": "$marin"
  }
}
```

### Property Type

**PoringKit** using JSON file to customize ui, Some complex type is not support. So, **PoringKit** already create several type to support some ui components in list below

#### Color

String to represent color using Codable.

* Decodable extension for UIColor using `DecodableColor` class, Represent color, there are 2 ways to define color
* **Hex Color**: Hex color format (supported both 6 digits and 8 digits) ex. "#00FF00", "#FFFFFF50"
* **Hex Color - Short** Hex color short form format (supported both 3 digits and 4 digits) ex. "#AAA", "#FFFC"
* **Predefined Color**: Predefine color name. see supported color in this list below:
* red
* green
* blue
* light\_gray
* dark\_gray
* gray
* white
* black
* clear
* cyan
* magenta
* yellow
* orange
* brown
* purple

### Element Property

#### UIView

| Property          | Type   | Apply to           |
| ----------------- | ------ | ------------------ |
| opacity           | double | alpha              |
| background\_color | Color  | backgroundColor    |
| corner\_radius    | double | layer.cornerRadius |
| border\_width     | double | layer.borderWidth  |
| border\_color     | Color  | layer.borderColor  |
| tint\_color       | Color  | tintColor          |

#### UIButton / UIBarButton

| Property                 | Type          | Apply to                       |
| ------------------------ | ------------- | ------------------------------ |
| font_family              | Font Family   | titleLabel.font                |
| font_style               | Font Style    | titleLabel.font                |
| font_size                | Double        | titleLabel.font                |
| text_alignment*          | TextAlignment | titleLabel.textAlignment       |
| text\_color              | Color         | setFontColor(\_, .normal)      |
| text\_color\_selected    | Color         | setFontColor(\_, .selected)    |
| text\_color\_disabled    | Color         | setFontColor(\_, .disabled)    |
| text\_color\_highlighted | Color         | setFontColor(\_, .highlighted) |

\*UIBarButton does not have 'text_alignment' property

#### UILabel

| Property          | Type          | Apply to           |
| ----------------- | ------------- | ------------------ |
| opacity           | Double        | alpha              |
| background\_color | Color         | backgroundColor    |
| corner\_radius    | Double        | layer.cornerRadius |
| border\_width     | Double        | layer.borderWidth  |
| border\_color     | Color         | layer.borderColor  |
| tint\_color       | Color         | tintColor          |
| font_family       | Font Family   | titleLabel.font    |
| font_style        | Font Style    | titleLabel.font    |
| font_size         | Int           | titleLabel.font    |
| text_alignment    | TextAlignment | textAlignment      |

#### UITextField / UITextView

| Property          | Type            | Apply to           |
| ----------------- | --------------- | ------------------ |
| opacity           | Double          | alpha              |
| background\_color | Color           | backgroundColor    |
| corner\_radius    | Double          | layer.cornerRadius |
| border\_width     | Double          | layer.borderWidth  |
| border\_color     | Color           | layer.borderColor  |
| tint\_color       | Color           | tintColor          |
| font_family       | Font Family     | titleLabel.font    |
| font_style        | Font Style      | titleLabel.font    |
| font_size         | Int             | titleLabel.font    |
| text\_alignment   | TextAlignment   | textAlignment      |
| keyboard\_type    | KeyboardType    | keyboardType       |
| border_style      | TextBorderStyle | borderStyle        |

#### UIPageControl

| Property       | Type   | Apply to                      |
| -------------- | ------ | ----------------------------- |
| opacity        | Double | alpha                         |
| color          | Color  | pageIndicatorTintColor        |
| current\_color | Color  | currentPageIndicatorTintColor |

#### UISegmentedControl

| Property    | Type   | Apply to  |
| ----------- | ------ | --------- |
| opacity     | Double | alpha     |
| tint\_color | Color  | tintColor |

#### UISwitch

| Property      | Type   | Apply to       |
| ------------- | ------ | -------------- |
| opacity       | Double | alpha          |
| active\_color | Color  | onTintColor    |
| thumb\_color  | Color  | thumbTintColor |

#### UITableView

| Property          | Type   | Apply to           |
| ----------------- | ------ | ------------------ |
| opacity           | Double | alpha              |
| background\_color | Color  | backgroundColor    |
| corner\_radius    | Double | layer.cornerRadius |
| border\_width     | Double | layer.borderWidth  |
| border\_color     | Color  | layer.borderColor  |
| tint\_color       | Color  | tintColor          |
| separator\_color  | Color  | separatorColor     |

#### UICollectionView

| Property          | Type   | Apply to           |
| ----------------- | ------ | ------------------ |
| opacity           | Double | alpha              |
| background\_color | Color  | backgroundColor    |
| corner\_radius    | Double | layer.cornerRadius |
| border\_width     | Double | layer.borderWidth  |
| border\_color     | Color  | layer.borderColor  |
| tint\_color       | Color  | tintColor          |

### UINavigationBar / UIToolBar

| Property         | Type        | Apply to                                                |
| ---------------- | ----------- | ------------------------------------------------------- |
| tint\_color      | Color       | tintColor                                               |
| bar\_color       | Color       | barColor                                                |
| translucent      | Boolean     | translucent                                             |
| font_family*     | Font Family | titleTextAttribute[font], largeTitleTextAttribute[font] |
| font_style*      | Font Style  | titleTextAttribute[font], largeTitleTextAttribute[font] |
| font_size*       | Int         | titleTextAttribute[font]                                |
| large_font_size* | Int         | largeTitleTextAttribute[font]                           |

\*UIToolBar does not have font relate properties

### Custom Element

**PoringKit** also support custom element to be theme-able. start by add **PoringStyleElement** protocol into class (Only support `UIAppearance` class).
Next, implement `apply` function to theme this element. In this function will receive JSON Data of element.
You can use `Codable` protocol for extract JSON Data to JSON Object.

```swift
class CustomTextField: UITextField, PoringStyleElement {

  func apply(_ styleData: Data) {
    let style = try? JSONDecoder().decode(CustomTextFieldPoringStyle.self, from: styleData)
    text = style?.custom
  }

}
```

## Change Log

* Version 1.0.0:
    * Initial version.

## Author

* Siwasit Anmahapong [@bazaku](https://github.com/bazak)
* Rawipon Srivibha [@phoeniex](https://github.com/phoeniex)
* Vadym Markov, [@vadymmarkov](https://github.com/vadymmarkov) - Fashion Developer
