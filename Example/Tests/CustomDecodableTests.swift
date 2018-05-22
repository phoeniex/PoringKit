import Nimble
import Quick

@testable import PoringKit

class CustomDecodableTestsNimble: QuickSpec {
  
  override func spec() {
    describe ("uicolor") {
      context("create from predefinded string red") {
        it("get red color") {
          let json = "{\"tint_color\": \"red\"}"
          let jsonData = json.data(using: .utf8)!
          let jsonObject = try? JSONDecoder().decode(PoringStyle.self, from: jsonData)
          expect(jsonObject?.tintColor?.cgColor.components) == UIColor.red.cgColor.components
        }
      }
      context("create from 3 digits hex string #00F") {
        it("get blue") {
          let json = "{\"tint_color\": \"#00F\"}"
          let jsonData = json.data(using: .utf8)!
          let jsonObject = try? JSONDecoder().decode(PoringStyle.self, from: jsonData)
          expect(jsonObject?.tintColor?.cgColor.components) == UIColor.blue.cgColor.components
        }
      }
      context("create from 4 digits hex string #FFF0") {
        it("get white transparent color") {
          let json = "{\"tint_color\": \"#FFF0\"}"
          let jsonData = json.data(using: .utf8)!
          let jsonObject = try? JSONDecoder().decode(PoringStyle.self, from: jsonData)
          let expectColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0)
          expect(jsonObject?.tintColor?.cgColor.components) == expectColor.cgColor.components
        }
      }
      context("create from 6 digits hex string #00FF00") {
        it("get green color") {
          let json = "{\"tint_color\": \"#00FF00\"}"
          let jsonData = json.data(using: .utf8)!
          let jsonObject = try? JSONDecoder().decode(PoringStyle.self, from: jsonData)
          expect(jsonObject?.tintColor?.cgColor.components) == UIColor.green.cgColor.components
        }
      }
      context("create from 8 digits hex string #FFFF0000") {
        it("get yellow transparent color") {
          let json = "{\"tint_color\": \"#FFFF0000\"}"
          let jsonData = json.data(using: .utf8)!
          let jsonObject = try? JSONDecoder().decode(PoringStyle.self, from: jsonData)
          let expectColor = UIColor.init(red: 1, green: 1, blue: 0, alpha: 0)
          expect(jsonObject?.tintColor?.cgColor.components) == expectColor.cgColor.components
        }
      }
    }
    describe("NSTextAlignment") {
      context("create center alignment from string") {
        it("get center alignment key") {
          let json = "{\"text_alignment\": \"center\"}"
          let jsonData = json.data(using: .utf8)!
          let jsonObject = try? JSONDecoder().decode(PoringStyle.self, from: jsonData)
          expect(jsonObject?.textAlignment) == NSTextAlignment.center
        }
      }
    }
    describe("UIKeyboardType") {
      context("create number pad keyboard type from string") {
        it("get number pad keyboard type") {
          let json = "{\"keyboard_type\": \"number_pad\"}"
          let jsonData = json.data(using: .utf8)!
          let jsonObject = try? JSONDecoder().decode(PoringStyle.self, from: jsonData)
          expect(jsonObject?.keyboardType) == UIKeyboardType.numberPad
        }
      }
    }
    describe("UITextBorderStyle") {
      context("create none border style from string") {
        it("get none border style") {
          let json = "{\"border_style\": \"none\"}"
          let jsonData = json.data(using: .utf8)!
          let jsonObject = try? JSONDecoder().decode(PoringStyle.self, from: jsonData)
          expect(jsonObject?.borderStyle) == UITextBorderStyle.none
        }
      }
    }
  }
  
}
