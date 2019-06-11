//
//  ViewController.swift
//  CountOnMe
//
//  Created by Cindy Perat on 18/02/2019.
//  Copyright © 2019 Cindy Perat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var calculationUITextView: UITextView!
    
    // MARK: - Action
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        Calculator.addNumber(sender.tag)
        updateCalculationDisplay()
    }
    
    @IBAction func plus() {
        do {
            try Calculator.addOperator(.plus)
            updateCalculationDisplay()
        } catch CalculatorError.incorrectExpression {
            alertError(title: "Zéro!", message: "Expression incorrecte !")
        } catch {
            alertError(title: "Erreur", message: "Un erreur innatendue est survenue.")
        }
    }
    
    @IBAction func minus() {
        do {
            try Calculator.addOperator(.minus)
            updateCalculationDisplay()
        } catch CalculatorError.incorrectExpression {
            alertError(title: "Zéro!", message: "Expression incorrecte !")
        } catch {
            alertError(title: "Erreur", message: "Un erreur innatendue est survenue.")
        }
    }
    
    @IBAction func equal() {
        do {
            try Calculator.calculateTotal()
            updateCalculationDisplay()
        } catch CalculatorError.emptyExpression {
            alertError(title: "Zéro!", message: "Démarrez un nouveau calcul !")
        } catch CalculatorError.incorrectExpression {
            alertError(title: "Zéro!", message: "Entrez une expression correcte !")
        } catch {
            alertError(title: "Erreur", message: "Un erreur innatendue est survenue.")
        }
    }
    
    
    // MARK: - Methods
    private func updateCalculationDisplay() {
        calculationUITextView.text = Calculator.calculationString
    }
    
    private func alertError(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
}
