//
//  ViewController.swift
//  Lesson7
//
//  Created by Art Rosario on 5/12/15.
//  Copyright (c) 2015 Art Rosario. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func MyButton(sender: AnyObject) {
        let textFromTextField = self.textField.text
        myLabel.text = "Hello \(textFromTextField)"        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

