//
//  Calculator.swift
//  Calculator
//
//  Created by JeongTaek Han on 2021/11/22.
//

import Foundation

struct Calculator {
    private(set) var currentInputOperand = Labels.defaultOperand {
        didSet {
            removeUnnessaryFractionDigit()
            removeAfterMaximumDigitNumber()
        }
    }
    private(set) var currentInputOperator = Labels.emptyString
    
    private var isEvaluated = false
    private(set) var mathExpression: [(operatorSymbole: String, operandNumber: String)] = []
    private var maximumDigit = 15
    
    mutating func touchNumberButton(_ number: String) {
        if isEvaluated {
            let temporaryOperand = currentInputOperand + number
            resetAllExpression()
            updateCurrentInput(operandForm: temporaryOperand)
            return
        }
        
        if number == Labels.doubleZero && currentInputOperand == Labels.defaultOperand {
            return
        }
        
        if currentInputOperand == Labels.defaultOperand {
            updateCurrentInput(operandForm: number, operatorForm: currentInputOperator)
            return
        }
        
        currentInputOperand += number
    }
    
    mutating func touchPointButton() {
        if currentInputOperand.contains(Labels.pointSymbole) {
            return
        }
        
        if isEvaluated {
            let temporaryOperand = currentInputOperand + Labels.pointSymbole
            resetAllExpression()
            updateCurrentInput(operandForm: temporaryOperand)
            return
        }
        
        currentInputOperand += Labels.pointSymbole
    }
    
    mutating func touchOperatorButton(_ operatorSymbole: String) {
        if isEvaluated {
            let temporaryOperand = currentInputOperand
            resetAllExpression()
            mathExpression += [(Labels.emptyString, temporaryOperand)]
            updateCurrentInput(operatorForm: operatorSymbole)
            return
        }
        
        if currentInputOperand == Labels.defaultOperand && mathExpression.isEmpty {
            return
        }
        
        if currentInputOperand == Labels.defaultOperand {
            updateCurrentInput(operandForm: currentInputOperand, operatorForm: operatorSymbole)
            return
        }
        
        if mathExpression.isEmpty {
            mathExpression += [(Labels.emptyString, currentInputOperand)]
            updateCurrentInput(operatorForm: operatorSymbole)
            return
        }
        
        mathExpression += [(currentInputOperator, currentInputOperand)]
        updateCurrentInput(operatorForm: operatorSymbole)
    }
    
    mutating func touchSignChangeButton() {
        if currentInputOperand == Labels.defaultOperand {
            return
        }
        
        if isEvaluated {
            return
        }
        
        if currentInputOperand.hasPrefix(Labels.minusSignSymbole) {
            currentInputOperand.removeFirst()
            return
        }
        
        currentInputOperand.insert(contentsOf: Labels.minusSignSymbole, at: currentInputOperand.startIndex)
    }
    
    mutating func touchAllClearButton() {
        resetAllExpression()
    }
    
    mutating func touchClearEntryButton() {
        if isEvaluated == false {
            updateCurrentInput(operatorForm: currentInputOperator)
            return
        }
        
        resetAllExpression()
    }
    
    mutating func touchEvaluateButton() {
        if isEvaluated {
            return
        }
        
        mathExpression += [(currentInputOperator, currentInputOperand)]
        
        isEvaluated = true
        let stringFormula = mathExpression.reduce(Labels.emptyString) { (previousResult, each) in
            return previousResult + each.operatorSymbole + each.operandNumber
        }
        
        do {
            let result = try ExpressionParser.parse(from: stringFormula).result()
            let stringResult = String(result)
            updateCurrentInput(operandForm: stringResult)
        } catch CalculatorError.divideByZero {
            updateCurrentInput(operandForm: Labels.notANumber)
        } catch {
            updateCurrentInput(operandForm: Labels.error)
        }
    }
    
    
    mutating private func updateCurrentInput(operandForm: String = Labels.defaultOperand, operatorForm: String = Labels.emptyString) {
        currentInputOperator = operatorForm
        currentInputOperand = operandForm
    }
    
    mutating private func resetAllExpression() {
        updateCurrentInput()
        mathExpression = []
        isEvaluated = false
    }
    
    mutating private func removeUnnessaryFractionDigit() {
        if isEvaluated && currentInputOperand.hasSuffix(".0") {
            guard let index = currentInputOperand.firstIndex(of: Character(Labels.pointSymbole)) else {
                return
            }
            
            currentInputOperand = String(currentInputOperand[..<index])
        }
    }
    
    mutating private func removeAfterMaximumDigitNumber() {
        if currentInputOperand.count >= maximumDigit {
            currentInputOperand.removeLast()
        }
    }
    
}
