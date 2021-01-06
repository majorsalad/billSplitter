//
//  ResultsViewController.swift
//  BillSplitter
//
//  Created by Faisal Salad on 12/25/20.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalsLabel: UILabel!
    @IBOutlet weak var descriptionText: UILabel!
    @IBOutlet weak var recalculateButton: UIButton!
    
    var bill : Float?
    var tipAmount : Float?
    var numOfPeople : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recalculateButton.layer.cornerRadius = 10.0
        totalsLabel.text = String(format: "%.02f", bill ?? "N/A")
        descriptionText.text = "Split between \(numOfPeople ?? -1) people, with \n \(tipAmount ?? -1)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
