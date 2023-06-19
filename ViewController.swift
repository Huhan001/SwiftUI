//
//  ViewController.swift
//  CardWorkout
//
//  Created by Humphrey Hanson on 19.06.23.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet var cardImageview: UIImageView!
  
  @IBOutlet var startbutton: UIButton!
  @IBOutlet var Restartbutton: UIButton!
  @IBOutlet var Rulesbutton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    startbutton.layer.cornerRadius = 8
    Restartbutton.layer.cornerRadius = 8
    Rulesbutton.layer.cornerRadius = 8
    
  }
 
  @IBAction func stopbuttontaped(_ sender: UIButton) {
  }
  
}

