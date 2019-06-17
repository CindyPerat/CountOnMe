//
//  CalculatorTestCase.swift
//  CountOnMeTests
//
//  Created by Cindy Perat on 11/06/2019.
//  Copyright © 2019 Cindy Perat. All rights reserved.
//

import XCTest
@testable import CountOnMe

class CalculatorTestCase: XCTestCase {
    // Calcul "8+8=16"
    func testGivenCalculationIsEightPlusEight_WhenEqualIsTapped_ThenTotalIsSixteen() {
        Calculator.addNumber(8)
        XCTAssertNoThrow(try Calculator.addOperator(.plus))
        Calculator.addNumber(8)
        XCTAssertNoThrow(try Calculator.calculateTotal())
        
        XCTAssertEqual(Calculator.calculationString, "8+8=16")
    }
    
    // Calcul vide puis opérateur entré
    func testGivenCalculationIsEmpty_WhenOperatorIsTapped_ThenErrorIsDisplay() {
        XCTAssertThrowsError(try Calculator.addOperator(.plus)) { error in
            XCTAssertEqual(error as! CalculatorError, CalculatorError.incorrectExpression)
        }
    }
    
    // Calcul vide puis total demandé
    func testGivenCalculationIsEmpty_WhenEqualIsTapped_ThenErrorIsDisplay() {
        XCTAssertThrowsError(try Calculator.calculateTotal()) { error in
            XCTAssertEqual(error as! CalculatorError, CalculatorError.emptyExpression)
        }
    }
    
    // Calcul "1+" puis opérateur entré
    func testGivenCalculationLastPartIsOperator_WhenOperatorIsTapped_ThenErrorIsDisplay() {
        XCTAssertThrowsError(try Calculator.addOperator(.plus)) { error in
            XCTAssertEqual(error as! CalculatorError, CalculatorError.incorrectExpression)
        }
    }
    
    // Calcul "1+" puis total demandé
    func testGivenCalculationLastPartIsOperator_WhenEqualIsTapped_ThenErrorIsDisplay() {
        XCTAssertThrowsError(try Calculator.calculateTotal()) { error in
            XCTAssertEqual(error as! CalculatorError, CalculatorError.emptyExpression)
        }
    }
    
    func testGivenCalculationIsEntered_WhenResetIsTapped_ThenCalculationIsReset() {
        Calculator.addNumber(8)
        XCTAssertNoThrow(try Calculator.addOperator(.plus))
        Calculator.addNumber(8)
        
        Calculator.reset()
        
        XCTAssertEqual(Calculator.calculationString, "")
    }
}
