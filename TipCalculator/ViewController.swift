//
//  ViewController.swift
//  TipCalculator
//
//  Created by Pangilinan, Melissa on 10/24/16.
//  Copyright © 2016 Pangilinan, Melissa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
override func viewWillAppear(_ animated: Bool) {
    let defaults = UserDefaults.standard
   // let stringValue = defaults.object(forKey: "some_key_that_you_choose") as! String
    let intValue = defaults.integer(forKey: "selectedTipIndex")
    tipControl.selectedSegmentIndex = intValue
    super.viewWillAppear(animated)
    print("view will appear")
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        
        let tipPercentages = [0.15, 0.18, 0.2]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = tip + bill
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

}

