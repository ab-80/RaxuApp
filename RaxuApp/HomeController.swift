//
//  HomeController.swift
//  RaxuApp
//
//  Created by Andrew Bergerson on 10/27/20.
//  Copyright © 2020 Raxu. All rights reserved.
//

import UIKit
import Firebase


class HomeController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var financeButton: UIButton!
    @IBOutlet weak var businessButton: UIButton!
    @IBOutlet weak var goalsButton: UIButton!
    @IBOutlet weak var planningButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        welcomeLabel.text = "Welcome, \(global_name!)"
        
        /*
        financeButton.layer.borderWidth = 1
        financeButton.layer.borderColor = UIColor.black.cgColor
        businessButton.layer.borderWidth = 1
        businessButton.layer.borderColor = UIColor.black.cgColor
        goalsButton.layer.borderWidth = 1
        goalsButton.layer.borderColor = UIColor.black.cgColor
        planningButton.layer.borderWidth = 1
        planningButton.layer.borderColor = UIColor.black.cgColor
 */
        financeButton.layer.cornerRadius = 30
        businessButton.layer.cornerRadius = 30
        goalsButton.layer.cornerRadius = 30
        planningButton.layer.cornerRadius = 30
    }
    
    
}
