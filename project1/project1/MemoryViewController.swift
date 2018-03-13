//
//  MemoryViewController.swift
//  project1
//
//  Created by Pujan Tandukar on 3/12/18.
//  Copyright © 2018 Pujan Tandukar. All rights reserved.
//

import UIKit

class MemoryViewController: UIViewController {

    @IBOutlet weak var dateDetail: UILabel!
    @IBOutlet weak var emotionDetail: UILabel!
    @IBOutlet weak var titleDetail: UILabel!
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var descriptionDetail: UITextView!
    
    var dateDetails = String()
    var emotionDetails = String()
    var titleDetails = String()
    var descriptionDetails = String()
    var imageDetails = UIImage()
    var colorDetail = UIColor()
    
    override func viewWillAppear(_ animated: Bool) {
        dateDetail.text=dateDetails
        emotionDetail.text = emotionDetails
        emotionDetail.textColor = colorDetail
        titleDetail.text = titleDetails
        
        descriptionDetail.text = descriptionDetails
        descriptionDetail.sizeToFit()

        imageDetail.image = imageDetails
        imageDetail.clipsToBounds = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
