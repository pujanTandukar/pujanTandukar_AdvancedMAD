//
//  ViewController.swift
//  project1
//
//  Created by Pujan Tandukar on 3/7/18.
//  Copyright © 2018 Pujan Tandukar. All rights reserved.
//

import UIKit
import RealmSwift
import AudioToolbox

class ViewController: UIViewController, UITextViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionTextField: UITextView!
    @IBOutlet weak var nameLabelField: UITextField!
    @IBOutlet weak var emotionLabel: UIButton!
    
    var realm : Realm!
    var memoryList: Results<Memory> {
        get {
            return realm.objects(Memory.self)
        }
    }
    
    var nameField = String()
    var extraDetailField = String()
    var descriptionField = String()
    var imageField = UIImage()
    var dateField = String()
    var emotionField = String()
    var colorField = UIColor()
    var myColor = UIColor()
    var newMem = Memory()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameLabelField.delegate = self
        self.descriptionTextField.delegate = self
        descriptionTextField.contentInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        //initialize the realm variable
        do {
            realm = try Realm()
        } catch let error {
            print(error.localizedDescription)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if(descriptionTextField.text == "Please enter memory description"){
            descriptionTextField.text = ""
            descriptionTextField.textColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
        }
        textView.becomeFirstResponder()
    }
    
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if(descriptionTextField.text == ""){
            descriptionTextField.text = "Please enter memory description"
            descriptionTextField.textColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1)
        }
        descriptionTextField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.nameLabelField.resignFirstResponder()
        self.view.endEditing(true)
        return true
    }
    
    func makeButtonDisappear(){
        emotionButtons.forEach { (button) in
            UIView.animate(withDuration: 0.3, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    
    @IBOutlet var emotionButtons: [UIButton]!
    @IBAction func emotionHandler(_ sender: UIButton) {
        makeButtonDisappear()
    }
    
    @IBAction func emotionTapper(_ sender: UIButton) {
        guard let title = sender.currentTitle, let city = emotions(rawValue: title) else{
            return
        }
        switch city{
        case .Happy :
            emotionLabel.setTitle("Happy", for: .normal)
            makeButtonDisappear()
            let happyColor = UIColor(red: 0.91, green: 0.77, blue: 0.21, alpha: 1)
            emotionLabel.setTitleColor(happyColor, for: .normal)
            myColor = happyColor
            break
        case .Sad :
            emotionLabel.setTitle("Sad", for: .normal)
            makeButtonDisappear()
            let sadColor = UIColor(red: 0.003, green: 0.59, blue: 0.96, alpha: 1)
            emotionLabel.setTitleColor(sadColor, for: .normal)
            myColor = sadColor
            break
        case .Anger :
            emotionLabel.setTitle("Anger", for: .normal)
            makeButtonDisappear()
            let angerColor = UIColor(red: 0.84, green: 0.15, blue: 0.24, alpha: 1)
            emotionLabel.setTitleColor(angerColor, for: .normal)
            myColor = angerColor
            break
        case .Excited :
            emotionLabel.setTitle("Excited", for: .normal)
            makeButtonDisappear()
            let excitedColor = UIColor(red: 0.95, green: 0.6, blue: 0.29, alpha: 1)
            emotionLabel.setTitleColor(excitedColor, for: .normal)
            myColor = excitedColor
            break
        case .Suprised :
            emotionLabel.setTitle("Suprised", for: .normal)
            makeButtonDisappear()
            let suprisedColor = UIColor(red: 0.50, green: 0.69, blue: 0.41, alpha: 1)
            emotionLabel.setTitleColor(suprisedColor, for: .normal)
            myColor = suprisedColor
            break
        }
    }
    
    @IBAction func addImageButton(_ sender: Any) {
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        print("okay")
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.allowsEditing = true

        let alertController = UIAlertController(title: "Add an image", message: "Choose From:", preferredStyle: .actionSheet)

        let cameraAction = UIAlertAction(title: "Camera", style: .default){ (action) in
            pickerController.sourceType = .camera
            self.present(pickerController, animated: true, completion: nil)
        }

        let photoAction = UIAlertAction(title: "Photo Libary", style: .default){ (action) in
            pickerController.sourceType = .photoLibrary
            self.present(pickerController, animated: true, completion: nil)
        }
        
        let savedPhotosAction = UIAlertAction(title: "Moments (Saved Photos Album)", style: .default) { (action) in
            pickerController.sourceType = .savedPhotosAlbum
            self.present(pickerController, animated: true, completion: nil)
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        
        alertController.addAction(cameraAction)
        alertController.addAction(photoAction)
        alertController.addAction(savedPhotosAction)
        alertController.addAction(cancelAction)
        alertController.popoverPresentationController?.sourceView = self.view // works for both iPhone & iPad
        present(alertController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        let image = info[UIImagePickerControllerEditedImage] as! UIImage
        imageView.image = image
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "saveSegue"{
            
            if ((nameLabelField.text?.isEmpty) == false){
                nameField=emotionLabel.titleLabel!.text!
    
                let date = Date()
                let calendar = Calendar.current
                let year = String(calendar.component(.year, from: date))
                let month = String(changeMonth(calendar.component(.month, from: date)))
                let day = String(calendar.component(.day, from: date))
                dateField = month + " " + day + ", " + year
                print("Success 1")
                            
                colorField = myColor
                if ((descriptionTextField.text?.isEmpty) == false){
                    descriptionField=nameLabelField.text!
                    extraDetailField = descriptionTextField.text
                    print("Success 2")
                    
                    let newMemoryItem = Memory()
//                    newMemoryItem.color = myColor
                    newMemoryItem.date = dateField
                    newMemoryItem.descriptions = extraDetailField
                    newMemoryItem.name = descriptionField
//                    newMemoryItem.image = imageField
                    newMemoryItem.emotion = nameField
                    
                    newMem = newMemoryItem
                    
//                    do{
//                        try self.realm.write{
//                            self.realm.add(newMemoryItem)
//                            print("REALM DATA ADDED")
//                            print(Realm.Configuration.defaultConfiguration.fileURL!)
//                        }
//                    } catch let error{
//                        print(error.localizedDescription)
//                    }
                }
            }
        }
    }
    
    func changeMonth(_ i: Int) -> String{
        switch i {
        case 1:
            return "January"
        case 2:
            return "February"
        case 3:
            return "March"
        case 4:
            return "April"
        case 5:
            return "May"
        case 6:
            return "June"
        case 7:
            return "July"
        case 8:
            return "August"
        case 9:
            return "September"
        case 10:
            return "October"
        case 11:
            return "November"
        case 12:
            return "December"
        default:
            return " "
        }
    }
}
