//
//  Calculator.swift
//  OS Z
//
//  Created by 김준우 on 2015. 6. 24..
//  Copyright (c) 2015년 김준우. All rights reserved.
//

import UIKit

class Calculator: UIViewController {
    
    // boolean to check whether typing a num or pressing an operation
    @IBOutlet var lblResult: UILabel!
    
    var result = Float()
    var currentNumber = Float()
    
    var currentOp = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        currentOp = "="
        lblResult.text = ("\(result)")
        
    if UIDevice.current.orientation.isLandscape {
            UIDeviceOrientation.portrait
            
        }
        
    }
    
    override func shouldAutorotate() -> Bool {
        return false

    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return [UIInterfaceOrientationMask.landscapeLeft,UIInterfaceOrientationMask.landscapeRight]
    }
    
    @IBAction func btnNumberInput(_ sender: UIButton) {
        currentNumber = currentNumber * 10 + Float(sender.titleLabel!.text!)!
        lblResult.text = ("\(currentNumber)")
    }
    
    @IBAction func btnOperation(_ sender: UIButton) {
        
        switch currentOp {
        case "=":
            result = currentNumber
        case "+":
            result = result + currentNumber
        case "-":
            result = result - currentNumber
        case "*":
            result = result * currentNumber
        case "/":
            result = result / currentNumber
        default:
            print("error")
        }
        
        currentNumber = 0
        lblResult.text = ("\(result)")
        
        if(sender.titleLabel!.text == "=") {
            result = 0
        }
        
        currentOp = sender.titleLabel!.text! as String!
        
    }
    
    @IBAction func btnClear(_ sender: UIButton) {
        result = 0
        currentNumber = 0
        currentOp = "="
        lblResult.text = ("\(result)")
    }
    
    
}
