//
//  ViewController.swift
//  Tip
//
//  Created by Kurt LaBlanc on 9/8/20.
//  Copyright © 2020 Kurt LaBlanc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var customTipAmount: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    }
    @IBAction func onTap(_ sender: Any) {
        //closes keyboard when tapped off of it
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        //sets bill equal to variable
        //defines percentages as is
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [0.15, 0.18, 0.2]
        let customTip = Double(customTipAmount.text!) ?? 0
        
        //if there is a custom tip then program runs this
        if customTip != 0.00 {
            let newTip = Double((customTip / 100) * bill)
            let newTotal = bill + newTip
            tipPercentageLabel.text = String(format: "$%.2f", newTip)
            totalLabel.text = String(format: "$%.2f", newTotal)
            
        }
        else {
            //if there is no custom tip it goes to these statments
            //calculates tip amount and total amount
            let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
            let total = bill + tip
            
            //used for formatting in the label boxes
            tipPercentageLabel.text = String(format: "$%.2f", tip)
            totalLabel.text = String(format: "$%.2f", total)
            
        }
        
    }
    
}
