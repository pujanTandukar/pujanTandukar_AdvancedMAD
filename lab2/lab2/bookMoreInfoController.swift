//
//  bookMoreInfoController.swift
//  lab2
//
//  Created by Pujan Tandukar on 2/20/18.
//  Copyright © 2018 Pujan Tandukar. All rights reserved.
//

import UIKit

class bookMoreInfoController: UITableViewController {
    
    var myBookAuthorInfo = String()
    var myBookInfo = String()
    
    @IBOutlet weak var bookInfoTitle: UILabel!
    @IBOutlet weak var reasonInfoLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        bookInfoTitle.text=myBookAuthorInfo
        reasonInfoLabel.text=myBookInfo
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
