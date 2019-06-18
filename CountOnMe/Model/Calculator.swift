//
//  Calculator.swift
//  CountOnMe
//
//  Created by Cindy Perat on 01/03/2019.
//  Copyright © 2019 Cindy Perat. All rights reserved.
//

import Foundation

class Calculator {
    // MARK: - Properties
    static var enteredNumbers: [String] = [String()] // Tableau contenant les chiffres/nombres du calcul
    static var enteredOperators: [Operator] = [.plus] // Tableau contenant les signes du calcul
    static var calculationString = "" // Calcul entier qui sera affiché à l'utilisateur
    
    // MARK: - Methods
    static func addNumber(_ newNumber: Int) {
        if let lastEnteredNumber = enteredNumbers.last {
            var lastEnteredNumberMutable = lastEnteredNumber
            lastEnteredNumberMutable += "\(newNumber)"
            enteredNumbers[enteredNumbers.count-1] = lastEnteredNumberMutable
        }
        
        updateCalculationString()
    }
    
    static func addOperator(_ newOperator: Operator) throws {
        if let lastEnteredNumber = enteredNumbers.last {
            if lastEnteredNumber.isEmpty {
                throw CalculatorError.incorrectExpression
            }
        }
        
        enteredOperators.append(newOperator)
        enteredNumbers.append("")
        updateCalculationString()
    }
    
    static func calculateTotal() throws {
        if let lastEnteredNumber = enteredNumbers.last {
            if lastEnteredNumber.isEmpty {
                if enteredNumbers.count == 1 {
                    throw CalculatorError.emptyExpression
                } else {
                    throw CalculatorError.incorrectExpression
                }
            }
        }
        
        var total = 0
        for (i, enteredNumber) in enteredNumbers.enumerated() {
            if let number = Int(enteredNumber) {
                if enteredOperators[i] == .plus {
                    total += number
                } else if enteredOperators[i] == .minus {
                    total -= number
                }
            }
        }
        
        calculationString = calculationString + "=\(total)"
        clear()
    }
    
    static func reset() {
        calculationString = ""
        clear()
    }
    
    private static func clear() {
        enteredNumbers = [String()]
        enteredOperators = [.plus]
    }
    
    private static func updateCalculationString() {
        var text = ""
        
        for (i, enteredNumber) in enteredNumbers.enumerated() {
            if i > 0 {
                text += enteredOperators[i].rawValue // Add operator
            }
            
            text += enteredNumber // Add number
        }
        
        calculationString = text
    }
}
