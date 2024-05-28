//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        
        
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        if sender.currentTitle == "20%" {
            twentyPctButton.isSelected = true
            tenPctButton.isSelected = false
            zeroPctButton.isSelected = false
        } else if sender.currentTitle == "10%" {
            twentyPctButton.isSelected = false
            tenPctButton.isSelected = true
            zeroPctButton.isSelected = false
        } else {
            twentyPctButton.isSelected = false
            tenPctButton.isSelected = false
            zeroPctButton.isSelected = true
        }
        
        billTextField.endEditing(true)
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        splitNumberLabel.text = String(Int(sender.value))
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        var tip : Float = 0.0
        
        if twentyPctButton.isSelected {
            tip = 0.2
        } else if tenPctButton.isSelected {
            tip = 0.1
        }
        
        let split = Float(splitNumberLabel.text ?? "2")
        let bill = Float(billTextField.text ?? "0")
        
        
        calculatorBrain.calculateBill(tip: tip, bill: bill ?? 0.0, split: split ?? 2.0)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "goToResult" {
               let destinationVC = segue.destination as! ResultsViewController
               destinationVC.split = calculatorBrain.getSplit()
               destinationVC.total = calculatorBrain.getTotal()
               destinationVC.tip = calculatorBrain.getTip()
           }
       }
}

