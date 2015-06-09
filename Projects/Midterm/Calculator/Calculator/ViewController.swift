//
//  ViewController.swift
//  Calculator
//
//  Created by Art Rosario on 5/26/15.
//  Copyright (c) 2015 Art Rosario. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
enum ClearMode {
    case AllClear
    case Clear
}
    
    /*/* ERRORS */
    -pressing operator alone still adds 0 to array
    -"." shows if there is no decimal in problem
    */
    
    /*/* Need to do */
    -PEMDAS
    */
    
   var mode : ClearMode = .AllClear
    
    var thisNumber : String = ""
    var result : Double?
    var numberStringArray : [String] = []
    var wholeProblem : [Double] = []
    var thisMode : ClearMode = .AllClear
    var count = 0
    var dotCount = 0
    var operationUsed : String = ""
    var initialOperation : String = ""
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var Clear: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var divButton: UIButton!
    @IBOutlet weak var multButton: UIButton!
    @IBOutlet weak var subButton: UIButton!
    
    
    //BUTTONS 0-9 as well as "."
    @IBAction func buttonPress(sender: UIButton) {
        if (self.thisMode == .AllClear)
        {
            Clear.setTitle("C", forState: .Normal)
            self.thisMode = .Clear
        }
        let buttonText = sender.titleLabel!.text!
        count += 1
        
        // If 0 is first, do nothing
        if (buttonText == "0" && count == 1)
        {
            self.resultLabel.text == ""
            count = 0
        }
        
        else if(buttonText == ".")
        {
            dotCount += 1
            // If "." is pressed once and is first
            if(dotCount == 1 && count == 1)
            {
                dotCount += 1
                self.numberStringArray[0] = (buttonText)
                self.resultLabel.text = self.numberStringArray[count - 1]
                self.appendNewNumber(buttonText)
            }
            // if "." is pressed once and not first
            else if(dotCount == 1)
            {
                self.numberStringArray.append(buttonText)
                self.resultLabel.text?.extend(self.numberStringArray[count - 1 ])
                dotCount += 1
                self.appendNewNumber(buttonText)
            }
            // if "." is pressed more than once
            else
            {
                dotCount += 1
                count -= 1
            }
            
        }
        // Append Number
        else
        {
            if(count == 1)
            {
                self.numberStringArray.append(buttonText)
                self.resultLabel.text = self.numberStringArray[count - 1]
                self.appendNewNumber(buttonText)
          
               // println("\(count) numberString1")
               // println("\(numberStringArray) 1")
               
            }
            else
            {
                self.numberStringArray.append(buttonText)
                self.resultLabel.text?.extend(self.numberStringArray[count - 1 ])
                self.appendNewNumber(buttonText)
                
               // println("\(count) numberString2")
               // println("\(numberStringArray) 2")
            }
        }
        
     
    }
    
    //ADDITION
    @IBAction func Adding(sender: UIButton) {
        initialOperation = "+"
        var operations = whichOperation(operationUsed, initialOperation : initialOperation)
        
        if(operations == "-"||operations == "*"||operations == "/")
        {
            self.resultLabel.text = "\(result!)"
            operationUsed = "+"
        }
        else{
            if (wholeProblem.isEmpty == true)
            {
                self.wholeProblem.append(self.numberToConvert)
            }
         
            println("\(numberToConvert) firstToConvert a")
            numberStringArray.removeAll()
            count = 0
            dotCount = 0
            operationUsed = "+"
            if let calculation = result {
               //result =  calculation + self.numberToConvert
                println ("\(thisNumber) thisNumber a")
                println ("\(wholeProblem) wholeProblem a")
                thisNumber = ""
                self.resultLabel.text = "\(calculation)"
                //println("\(result) result if")
                
            }
            else{
                
                self.resultLabel.text = self.thisNumber
                result = self.numberToConvert
                thisNumber = ""
                println("\(thisNumber) this else")
                
            }
            
        }
        
    }
    
    //SUBTRACTION
    @IBAction func Subracting(sender: UIButton) {
        initialOperation = "-"
        var operations = whichOperation(operationUsed, initialOperation : initialOperation)
        
        if(operations == "+"||operations == "*"||operations == "/")
        {
            self.resultLabel.text = "\(result!)"
            operationUsed = "-"
        }
        else{
            self.wholeProblem.append(self.numberToConvert)
            numberStringArray.removeAll()
            var plusCount = 0
            count = 0
            dotCount = 0
            operationUsed = "-"
            
            if let _calculation = result {
                //calculation! -= self.firstToConvert
                println ("\(wholeProblem) whole")
                thisNumber = ""
                self.resultLabel.text = "\(result!)"
                println("\(thisNumber) this if")
                
            }
            else{
                
                self.resultLabel.text = self.thisNumber
                result = self.numberToConvert
                thisNumber = ""
                println("\(thisNumber) this else")
                
                
            }
            
        }
        
    }
    // MULTIPLYING
    @IBAction func Multiplying(sender: UIButton) {
        initialOperation = "*"
        var operations = whichOperation(operationUsed, initialOperation : initialOperation)
        if(operations == "+"||operations == "-"||operations == "/")
        {
            self.resultLabel.text = "\(result!)"
            operationUsed = "*"
        }
        else{
            self.wholeProblem.append(self.numberToConvert)
            numberStringArray.removeAll()
            var plusCount = 0
            count = 0
            dotCount = 0
            operationUsed = "*"
            
            if let _calculation = result {
                //calculation! *= self.firstToConvert
                println ("\(wholeProblem) whole")
                thisNumber = ""
                self.resultLabel.text = "\(result!)"
                println("\(thisNumber) this if")
                
            }
            else{
                
                self.resultLabel.text = self.thisNumber
                result = self.numberToConvert
                thisNumber = ""
                println("\(thisNumber) this else")
                
                
            }
            
        }
    }
    
    // DIVISION
    @IBAction func Dividing(sender: UIButton) {
        
        initialOperation = "/"
        var operations = whichOperation(operationUsed, initialOperation : initialOperation)
        if(operations == "+"||operations == "-"||operations == "*")
        {
            self.resultLabel.text = "\(result!)"
            operationUsed = "/"
        }
        else{
            self.wholeProblem.append(self.numberToConvert)
            numberStringArray.removeAll()
            var plusCount = 0
            count = 0
            dotCount = 0
            operationUsed = "/"
            
            if let _calculation = result {
                //calculation! /= self.firstToConvert
                println ("\(wholeProblem) whole")
                thisNumber = ""
                self.resultLabel.text = "\(result!)"
                println("\(thisNumber) this if")
                
            }
            else{
                
                self.resultLabel.text = self.thisNumber
                result = self.numberToConvert
                thisNumber = ""
                println("\(thisNumber) this else")
                
                
            }
            
        }
    }
    

    //ALL CLEAR BUTTON
    @IBAction func allClearButton(sender: UIButton) {
        if ( self.thisMode == .Clear)
        {
           if wholeProblem.isEmpty == true
           {
            Clear.setTitle("AC", forState: .Normal)
            self.thisMode = .AllClear
            numberStringArray = []
            self.resultLabel.text = "0"
            count = 0
            dotCount = 0
            thisNumber = ""
            }
           else{
            Clear.setTitle("AC", forState: .Normal)
            self.thisMode = .AllClear
            numberStringArray = []
            self.resultLabel.text = "0"
            count = 0
            dotCount = 0
            wholeProblem.removeLast()
            thisNumber = ""
            println ("\(wholeProblem) clear")
            }
        }
        else if (self.thisMode == .AllClear)
        {
            self.resultLabel.text = "0"
            count = 0
            dotCount = 0
            thisNumber = ""
            result = nil
            wholeProblem = []
            println ("\(wholeProblem) all clear")
        }
        println ("\(result) calculation")

    }
    
    //NEGATE NUMBER BUTTON
    @IBAction func negateButton(sender: UIButton) {
     
       var negatedValue = self.numberToConvert * -1.0
        //convert back the double to string
       var negatedString :String = String(format:"%.1f", negatedValue)
        //println("c: \(c)") // c: 1.5
        self.thisNumber = negatedString
        println("\(negatedValue)")
        self.resultLabel.text = self.thisNumber

    }
    
    //PERCENT
    @IBAction func percentButton(sender: UIButton) {
        var percentage = self.numberToConvert / 100
        var percentString : String = String(stringInterpolationSegment: percentage)
        self.thisNumber = percentString
        self.resultLabel.text = self.thisNumber
        
    }
    
    //EQUALS BUTTON
    @IBAction func equalButton(sender: UIButton) {
        
        let nextNumberText = sender.titleLabel!.text!
        self.wholeProblem.append(self.numberToConvert)
        var lastNumber = resultLabel.text! as NSString
     
        //check what operation was last used
        if (operationUsed == "+")
        {
            println ("\(result) calc = before")
            println ("\(numberToConvert) firstToConvert =")
            result! = result! + self.numberToConvert
            println ("\(result) calc = after")
            

        }
        else if (operationUsed == "-")
        {
            result! = result! - self.numberToConvert
        }
        else if (operationUsed == "*"){
            result! = result! * self.numberToConvert
        }
        else if (operationUsed == "/")
        {
            result! = result! / self.numberToConvert
        }
        self.resultLabel.text!  = "\(result!)"

        println ("\(wholeProblem) wholeProbl")
    }
    
 

    func whichOperation (operations : String, initialOperation : String ) -> String
    {
        if (result == nil)
        {
            result = 0
            println("\(initialOperation) func before")
            result! += self.numberToConvert
            return initialOperation
        }
        else{
            //ADDITION
            if (operations == "+"){
                self.wholeProblem.append(self.numberToConvert)
                result! += self.numberToConvert
                
                numberStringArray.removeAll()
                count = 0
                dotCount = 0
                thisNumber = ""
               // self.resultLabel.text = "\(calculation)"
                
                return "+"
                
            }
                //SUBTRACTION
            else if (operations == "-")
            {
                self.wholeProblem.append(self.numberToConvert)
                result! -= self.numberToConvert

                numberStringArray.removeAll()
                count = 0
                dotCount = 0
                thisNumber = ""
                
                //self.resultLabel.text = "\(calculation!)"
                return "-"
                
              
            }
            //MULTIPLICATION
            else if (operations == "*")
            {
                self.wholeProblem.append(self.numberToConvert)
                result! *= self.numberToConvert

                numberStringArray.removeAll()
                count = 0
                dotCount = 0
                thisNumber = ""
                
                //self.resultLabel.text = "\(calculation!)"
                return "*"
                
               
            }
            //DIVISION
            else if (operations == "/")
            {
                self.wholeProblem.append(self.numberToConvert)
                result! /= self.numberToConvert

                numberStringArray.removeAll()
                count = 0
                dotCount = 0
                thisNumber = ""
                
                self.resultLabel.text = "\(result!)"
                return "/"
                
            }
        }
    
        return initialOperation
        
    }
    
    func hasDecimal(str:String) -> Bool {
        let decimal = "."
        let decimalChar = decimal[decimal.startIndex]
        for char in str {
            if decimalChar == char{
                return true
            }
        }
        return false
    }
    
    var numberToConvert : Double {
        return NSString(string:self.thisNumber).doubleValue
    }
    
    func appendNewNumber(number:String){
        self.thisNumber += number
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

