//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var tipSelected = 0.0
    var numberOfPeople = 0
    var calculation = "0.0"
    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!

    

    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        let selectedPct = sender.currentTitle
        
        if selectedPct == "0%" {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tipSelected = 0.0
        } else if selectedPct == "10%" {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            tipSelected = 0.1
        } else {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            tipSelected = 0.2
        }
        
        
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let doubleBillTextField = Double(billTextField.text ?? "0.0")
        let doubleSplitNumber = Double(splitNumberLabel.text ?? "0.0")
        
        if doubleBillTextField != nil {
            
            let calculate = ((doubleBillTextField! * tipSelected) + doubleBillTextField!) / doubleSplitNumber!
            calculation = String(format: "%.2f", calculate)
        }
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = calculation
            destinationVC.totalPeople = numberOfPeople
            destinationVC.percentTip = tipSelected
        }
    }
    
}

