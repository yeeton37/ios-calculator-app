//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorController: UIViewController {

    @IBOutlet weak private var numberLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func changeNumberLabel(text: String) {
        let currentText = numberLabel.text ?? "0"
        
        guard currentText != "0" ||
              text != "00" else {
                  return
        }
        
        if currentText == "0" {
            numberLabel.text = text
        } else {
            numberLabel.text = currentText + text
        }
    }
}

// MARK: - Button Event
extension CalculatorController {
    
    @IBAction func touchUpOperandButton(_ sender: UIButton) {
        guard let operand = sender.currentTitle else { return }
        
        changeNumberLabel(text: operand)
    }
    
    @IBAction func touchUpDotButton(_ sender: UIButton) {
        if numberLabel.text?.contains(".") == false {
            let currentText = numberLabel.text ?? "0"
            guard let operand = sender.currentTitle else { return }
            
            numberLabel.text = currentText + operand
        }
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        guard let `operator` = sender.currentTitle else { return }
        
        operatorLabel.text = `operator`
    }
        
    
}
