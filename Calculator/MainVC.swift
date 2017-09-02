//
//  MainVC.swift
//  Calculator
//
//  Created by Erick Tran.
//  Copyright © 2017 Erick Tran. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var outputLbl: UILabel!
    
    //Declare all value
    var runningNumber = ""
    enum Operations: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
    }
    
    var currentOperation = Operations.Empty
    var leftValStr = ""
    var rightValStr = ""
    var result = ""
    var memory = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //connect with all 10 numbers
    @IBAction func numberPressed(sender: UIButton) {
        runningNumber += "\(sender.tag)"
        
        outputLbl.text = runningNumber
    }
    
    //connect with divide button
    @IBAction func divideBtnPressed(sender: UIButton) {
        processOperation(operation: .Divide)
    }
    
    //connect with multiply button
    @IBAction func multiplyBtnPressed(_ sender: UIButton) {
        processOperation(operation: .Multiply)
    }
    
    //connect with subtract button
    @IBAction func subtractBtnPressed(_ sender: UIButton) {
        processOperation(operation: .Subtract)
    }
    
    //connect with add button
    @IBAction func addBtnPressed(_ sender: UIButton) {
        processOperation(operation: .Add)
    }
    
    //connect with equal button
    @IBAction func equalBtnPressed(_ sender: Any) {
        processOperation(operation: currentOperation)
        currentOperation = Operations.Empty
        memory = outputLbl.text!
    }
    
    //connect with ac button
    @IBAction func acBtnPressed(_ sender: UIButton) {
        clearMemory()
    }
    
    //perform calculation
    func processOperation(operation: Operations){
        //check if user have enter any operator
        if currentOperation != Operations.Empty {
            //check if user have enter a number
            if runningNumber != "" {
                rightValStr = runningNumber
                runningNumber = ""
                if currentOperation == Operations.Add {
                    if leftValStr == "" {
                        leftValStr = memory
                    }
                    result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                } else if currentOperation == Operations.Subtract {
                    if leftValStr == "" {
                        leftValStr = memory
                    }
                    result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                } else if currentOperation == Operations.Multiply {
                    if leftValStr == "" {
                        leftValStr = memory
                    }
                    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                } else if currentOperation == Operations.Divide {
                    if leftValStr == "" {
                        leftValStr = memory
                    }
                    result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                }
                
                leftValStr = result
                outputLbl.text = result
                
            }
            currentOperation = operation
        } else {
            //what happen if operator is empty
            leftValStr = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
    
    //reset everything
    func clearMemory() {
        runningNumber = ""
        outputLbl.text = "0"
        rightValStr = "0"
        leftValStr = "0"
        result = "0"
        memory = "0"
        currentOperation = Operations.Empty
    }
    
}


































