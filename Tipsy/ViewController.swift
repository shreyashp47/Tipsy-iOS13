//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var stepperCount: UILabel!
    @IBOutlet weak var twentyPercentBT: UIButton!
    @IBOutlet weak var tenPercentBT: UIButton!
    @IBOutlet weak var zeroPercentBT: UIButton!
    @IBOutlet weak var totalBillTextField: UITextField!
    
    var tip = 0.10
      var numberOfPeople = 2
      var billTotal = 0.0
      var finalResult = "0.0"
      
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
       
        
    }

    @IBAction func stepperPressed(_ sender: UIStepper) {
        print(sender.value)
        stepperCount.text = String(format: "%.0f", sender.value)
                numberOfPeople = Int(sender.value)
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = totalBillTextField.text!
              if bill != "" {
                  billTotal = Double(bill)!
                  let result = billTotal * (1 + tip) / Double(numberOfPeople)
                  finalResult = String(format: "%.2f", result)
              }
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    @IBAction func tipSelection(_ sender: UIButton) {
        totalBillTextField.endEditing(true)
             
             zeroPercentBT.isSelected = false
             tenPercentBT.isSelected = false
             twentyPercentBT.isSelected = false
             sender.isSelected = true
             
             let buttonTitle = sender.currentTitle!
             let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
             let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
             tip = buttonTitleAsANumber / 100

        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            
                     let destinationVC = segue.destination as! ResultViewController
                     destinationVC.result = finalResult
                     destinationVC.tip = Int(tip * 100)
                     destinationVC.split = numberOfPeople

        }
    }
}

