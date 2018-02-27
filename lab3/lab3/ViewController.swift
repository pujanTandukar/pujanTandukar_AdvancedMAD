//
//  ViewController.swift
//  lab3
//
//  Created by Pujan Tandukar on 2/27/18.
//  Copyright © 2018 Pujan Tandukar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func share(_ sender: UIBarButtonItem) {
        var imageArray = [UIImage]()
        imageArray.append(imageView.image!)
        let shareScreen = UIActivityViewController(activityItems: imageArray,applicationActivities: nil)
        shareScreen.modalPresentationStyle = .popover
        shareScreen.popoverPresentationController?.barButtonItem = sender
        present(shareScreen, animated: true, completion: nil)
    }
    
    var imageName : String?
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        if let name = imageName {
            imageView.image = UIImage(named: name)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.navigationBar.prefersLargeTitles = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
