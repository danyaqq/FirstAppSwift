//
//  ViewController.swift
//  FirstApp
//
//  Created by Аринище on 16.09.2020.
//  Copyright © 2020 Аринище. All rights reserved.
//

import UIKit
@IBDesignable extension UIButton {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}
class ViewController: UIViewController {
    var stillTyping = false
    var firstNumber: Double = 0
    var secondNumber: Double = 0
    var operationSign: String = ""
    var dotIsPlaced = false
    var currentInput: Double {
        get{
            return Double(resultLabel.text!)!
        }
        set{
            let value = "\(newValue)"
            let valueArray = value.components(separatedBy: ".")
            if valueArray[1] == "0"{
                resultLabel.text = "\(valueArray[0])"
            } else {
            resultLabel.text = "\(newValue)"
            }
            stillTyping = false
        }
    }
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func digits(_ sender: UIButton) {
        let number = sender.tag
        if stillTyping {
        resultLabel.text = resultLabel.text! + String(number)
        } else {
            resultLabel.text = String(number)
            stillTyping = true
        }
        }

    @IBAction func twoOperandPressed(_ sender: UIButton) {
        operationSign = sender.currentTitle!
        firstNumber = currentInput
        stillTyping = false
        dotIsPlaced = false
    }
    func operateWithTwoNumbers(operation: (Double, Double) ->Double) {
        currentInput = operation(firstNumber, secondNumber)
        stillTyping = false
    }
    @IBAction func resultPressed(_ sender: UIButton) {
        if stillTyping {
            secondNumber = currentInput
        }
        
        dotIsPlaced = false
        if currentInput == secondNumber{
            switch operationSign {
            case "+":
                operateWithTwoNumbers {$0 + $1}
            case "-":
                operateWithTwoNumbers {$0 - $1}
            case "X":
                operateWithTwoNumbers {$0 * $1}
            case "/":
                operateWithTwoNumbers {$0 / $1}
            default: break
                
            }
        }

        if sender.tag == 11{
            resultLabel.text = "0"
            firstNumber = 0
            secondNumber = 0
            stillTyping = false
            operationSign = ""
            dotIsPlaced = false
        }
    }
    @IBAction func dotButton(_ sender: UIButton) {
        if stillTyping && !dotIsPlaced{
            resultLabel.text = resultLabel.text! + "."
            dotIsPlaced = true
        } else if !stillTyping && !dotIsPlaced {
            resultLabel.text = "0."
            dotIsPlaced = true
            stillTyping = true
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

