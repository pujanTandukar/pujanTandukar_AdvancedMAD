//
//  addBooks.swift
//  lab2
//
//  Created by Pujan Tandukar on 2/19/18.
//  Copyright © 2018 Pujan Tandukar. All rights reserved.
//

import UIKit

class addBooks: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var bookTextField: UITextField!
    @IBOutlet weak var bookFavTextField: UITextView!
    
    var addBook = String()
    var addBookFav = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bookTextField.delegate = self;
        self.bookFavTextField.delegate = self;
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "saveUnwind"{
            if ((bookTextField.text?.isEmpty) == false){
                addBook=bookTextField.text!
                print("Success 1")
                if ((bookFavTextField.text?.isEmpty) == false){
                    addBookFav=bookFavTextField.text!
                    print("Success 2")
                }
            }
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            textView.resignFirstResponder()
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
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
