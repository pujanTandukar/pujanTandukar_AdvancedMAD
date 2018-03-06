//
//  DetailViewController.swift
//  lab4
//
//  Created by Pujan Tandukar on 3/5/18.
//  Copyright © 2018 Pujan Tandukar. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet weak var labelView: UILabel!
    @IBOutlet weak var rgbView: UILabel!
    @IBOutlet weak var colordisplay: UIButton!
    
    var color = String()
    var label = String()
    var rgb = String()
    
    override func viewWillAppear(_ animated: Bool) {
        
        let colorFullHex = rgb.components(separatedBy: ",")
        let colorFullHex1 = colorFullHex[0].components(separatedBy: "(")
        let colorFullHex2 = colorFullHex[2].components(separatedBy: ")")
        
        print(colorFullHex[0])
        print(colorFullHex[1])
        print(colorFullHex[2])
        print("break")
        print(colorFullHex1[0])
        print(colorFullHex1[1])
        
        let red1 = colorFullHex1[1]
        let green1 = colorFullHex[1]
        let green2 = green1.components(separatedBy: " ")
        let green3 = green2[1]
        let blue1 = colorFullHex2[0]
        let blue2 = blue1.components(separatedBy: " ")
        let blue3 = blue2[1]
        
        let red = CGFloat((Float(red1))!/255)
        let green = CGFloat((Float(green3))!/255)
        let blue = CGFloat((Float(blue3))!/255)
        print(red)
        print(green)
        print(blue)
    
        let color2 = UIColor(red: red, green: green, blue: blue, alpha: 1)
        colordisplay.backgroundColor = color2
        labelView.text = "Hex Value: " + label
        rgbView.text = "RGB Value: " + rgb
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
//        colorView.
        
        configureView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: NSDate? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

