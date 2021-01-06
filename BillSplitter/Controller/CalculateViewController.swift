//
//  ViewController.swift
//  BillSplitter
//
//  Created by Faisal Salad on 12/8/20.
//

import UIKit

class CalculateViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var tipOption1: UIButton!
    @IBOutlet weak var tipOption2: UIButton!
    @IBOutlet weak var tipOption3: UIButton!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var splitNumber: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var tip : String? = nil
    var split : Int = 0
    var splitBill : Float = 0.0
    var tipPercentage : Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        calculateButton.layer.cornerRadius = 10.0
        stepper.autorepeat = true
        self.textField.delegate = self //the setup to dismiss keyboard, have to add "UITextFieldDelegate" to top
        tip = "0.1"
    }
    

    //figure out how to lock screen orientation
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) //dismisses keyboard if anywhere on the screen is pressed (excluding buttons)
    }

    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumber.text = Int(sender.value).description
    }
    
    
    @IBAction func tipSelected(_ sender: UIButton) {
        textField.resignFirstResponder() // dismisses keyboard when we select any of the tip buttons
        unselectButtons()
        
        
        if(sender.currentTitle! == "0%"){
            tipOption1.isSelected = true
            tip = "0.0"
        } else if(sender.currentTitle! == "10%"){
            tipOption2.isSelected = true
            tip = "0.1"
        } else if(sender.currentTitle! == "20%"){
            tipOption3.isSelected = true
            tip = "0.2"
        }
    }
    
    func unselectButtons(){
        tipOption1.isSelected = false
        tipOption2.isSelected = false
        tipOption3.isSelected = false
    }

    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = Float(textField.text!) ?? 0
        split = Int(splitNumber.text!) ?? 0
        tipPercentage = Float(tip!) ?? 0
       
        let total = bill + (bill * tipPercentage)
        print(total)
        splitBill = total / Float(split)
        print(splitBill)
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.bill = splitBill
            destinationVC.tipAmount = tipPercentage * 100
            destinationVC.numOfPeople = split
        }
    }
}
