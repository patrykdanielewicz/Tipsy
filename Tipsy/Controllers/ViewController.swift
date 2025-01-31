//
//  ViewController.swift
//  Tipsy
//
//  Created by Patryk Danielewicz on 13/02/2024.
//
//

import UIKit

class ViewController: UIViewController  {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipSelected: Float?
    var people: Float?
    var emount: Float?
    @IBAction func tipChanged(_ sender: UIButton) {
        let whichPressed = sender.currentTitle
        billTextField.endEditing(true)
        if whichPressed == "0%" {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tipSelected = 0.0
        }
        if whichPressed == "10%" {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            tipSelected = 0.1
        }
        if whichPressed == "20%" {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            tipSelected = 0.2
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let howMannyPeople = String(format: "%.0f", sender.value)
        people = Float(sender.value)
        splitNumberLabel.text = howMannyPeople
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        emount = Float(billTextField.text ?? "0")
        let resultCV = ResultsViewController()
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    print(((emount ?? 0) * (1 + (tipSelected ?? 0.1)))/(people ?? 2))
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            let amountNotOptional: Float = emount ?? 0
            let tipSelectedNotOptional: Float = tipSelected ?? 0.1
            let peopleNotOptional: Float = people ?? 2
            destinationVC.splitAmount = String(format: "%.0f",(amountNotOptional * (1 + tipSelectedNotOptional)) / peopleNotOptional)
            destinationVC.people = String(format: "%.0f", peopleNotOptional)
            destinationVC.tip = String(format: "%.0f", (tipSelectedNotOptional * 100))
        }
    }

}

 
