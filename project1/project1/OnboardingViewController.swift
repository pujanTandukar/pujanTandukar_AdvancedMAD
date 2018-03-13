//
//  OnboardingViewController.swift
//  project1
//
//  Created by Pujan Tandukar on 3/13/18.
//  Copyright © 2018 Pujan Tandukar. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBAction func onBoardingClick(_ sender: UIButton) {
        UserDefaults.standard.set("user", forKey: "name")
        performSegue(withIdentifier: "onBoarding", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
