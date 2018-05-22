//
//  AppDelegate.swift
//  PoringKit_Example
//
//  Created by Rawipon Srivibha on 05/16/2017.
//  Copyright (c) 2017 Rawipon Srivibha. All rights reserved.
//

import UIKit
import PoringKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    PoringKit.startStyle("ui.json")
    return true
  }
}






