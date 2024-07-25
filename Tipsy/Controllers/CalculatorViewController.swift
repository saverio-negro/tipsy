//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by Saverio Negro on 09/07/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipManager = TipManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billTextField.delegate = self
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        tipManager.setSplitNumber(number: Int(sender.value))
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        billTextField.endEditing(true)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        if zeroPctButton.isSelected {
            tipManager.setTipPercent(tipPercent: 0.0)
        } else if tenPctButton.isSelected {
            tipManager.setTipPercent(tipPercent: 0.1)
        } else {
            tipManager.setTipPercent(tipPercent: 0.2)
        }
        
        if let billAmount = Float(billTextField.text!) {
            
            tipManager.setBillAmount(amount: billAmount)
            tipManager.calculateTotalPerPerson()
            
            self.performSegue(withIdentifier: "goToResults", sender: self)
            billTextField.placeholder = "e.g. 123.56"
            
        } else {
            billTextField.placeholder = "Enter bill amount!"
        }
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
       return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResults" {
            let destination = segue.destination as! ResultsViewController
            destination.totalPerPerson = tipManager.getTotalPerPerson()
            destination.settingInfo = tipManager.getSettingInfo()
        }
    }
    
}
