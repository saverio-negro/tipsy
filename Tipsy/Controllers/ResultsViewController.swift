//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Saverio Negro on 09/07/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    var totalPerPerson: String?
    var settingInfo: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = totalPerPerson
        settingsLabel.text = settingInfo
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
