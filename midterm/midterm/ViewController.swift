//
//  ViewController.swift
//  midterm
//
//  Created by Pujan Tandukar on 3/15/18.
//  Copyright © 2018 Pujan Tandukar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var urlLabel: UITextField!
    
    var restName = String()
    var restURL = String()
    var realmRes = restaurants()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameLabel.delegate = self
        self.urlLabel.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.nameLabel.resignFirstResponder()
        self.urlLabel.resignFirstResponder()
        self.view.endEditing(true)
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "saveSegue"{
            if(nameLabel.text?.isEmpty == false){
                restName = nameLabel.text!
                restURL = urlLabel.text!
                realmRes.name = nameLabel.text!
                realmRes.url = urlLabel.text!
            }
        }
    }
}
