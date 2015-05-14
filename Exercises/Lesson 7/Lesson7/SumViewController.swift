//
//  ViewController.swift
//  Lesson7
//
//  Created by Art Rosario on 5/12/15.
//  Copyright (c) 2015 Art Rosario. All rights reserved.
//

import UIKit

class SumViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!

    @IBAction func calculate(sender: AnyObject) {
        let firstNumber = self.number1.text
        let secondNumber = self.number2.text
      
        // How to convert this into a Double?????
        let numberOne = NSString(string:firstNumber).doubleValue
        let numberTwo = NSString(string:
            secondNumber).doubleValue
        
        let sum = numberOne + numberTwo
        
        myLabel.text = "\(sum)"
        
        
        }
    
    @IBOutlet weak var number1: UITextField!
    
    @IBOutlet weak var number2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

