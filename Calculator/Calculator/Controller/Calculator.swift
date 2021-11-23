//
//  Calculator.swift
//  Calculator
//
//  Created by JeongTaek Han on 2021/11/22.
//

import Foundation

struct Calculator {
    private(set) var currentInputOperand = LabelContents.defaultOperand
    private(set) var currentInputOperator = LabelContents.emptyString
    private var isEvaluated = false
    private(set) var mathExpression: [(operatorSymbole: String, operandNumber: String)] = []
    
    mutating func touchAllClearButton() {
        resetAllExpression()
    }
    
    mutating func touchClearEntryButton() {
        resetAllExpression()
    }
    
    mutating private func updateCurrentInput(operandForm: String = LabelContents.defaultOperand, operatorForm: String = LabelContents.emptyString) {
        currentInputOperator = operatorForm
        currentInputOperand = operandForm
    }
    
    mutating private func resetAllExpression() {
        updateCurrentInput()
        mathExpression = []
        isEvaluated = false
    }
    
    private struct LabelContents {
        static let notANumber = "NaN"
        static let emptyString = ""
        static let defaultOperand = "0"
        static let minusSignSymbole = "-"
        static let pointSymbole = "."
        static let doubleZero = "00"
        static let error = "error"
    }
}
