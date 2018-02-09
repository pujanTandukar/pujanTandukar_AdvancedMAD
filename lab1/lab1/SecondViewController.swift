//
//  SecondViewController.swift
//  lab1
//
//  Created by Pujan Tandukar on 1/29/18.
//  Copyright © 2018 Pujan Tandukar. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBAction func listenButton(_ sender: UIButton) {
        //check to see if an app is installed
        if(UIApplication.shared.canOpenURL(URL(string: "spotify://")!)){
            //open the app with this URL scheme
            UIApplication.shared.open(URL(string: "nflx://")!, options: [:], completionHandler: nil)
        }
        else{
            UIApplication.shared.open(URL(string: "http://www.netflix.com/")!, options: [:], completionHandler: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

