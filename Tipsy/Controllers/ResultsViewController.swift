//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Ahnaf Ahmad on 5/27/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var total : Float = 0.0
    var tip : Int = 0
    var split : Int = 2
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
        totalLabel.text = String(format: "%0.2f", total)
        settingsLabel.text = "Split between \(split) people, with \(tip)% tip."
        
            
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
