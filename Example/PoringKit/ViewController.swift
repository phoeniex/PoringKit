//
//  ViewController.swift
//  AZPoringKit
//
//  Created by Rawipon Srivibha on 05/16/2017.
//  Copyright (c) 2017 Rawipon Srivibha. All rights reserved.
//

import UIKit
import PoringKit

class ViewController: UIViewController {
  @IBOutlet var textField1: UITextField!
  @IBOutlet var textField2: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  
    textField1.delegate = self
    textField2.delegate = self
  }
  
}

extension ViewController: UITextFieldDelegate {
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
}
