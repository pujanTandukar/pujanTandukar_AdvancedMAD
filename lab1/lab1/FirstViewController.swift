//
//  FirstViewController.swift
//  lab1
//
//  Created by Pujan Tandukar on 1/29/18.
//  Copyright © 2018 Pujan Tandukar. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var firstPicker: UIPickerView!
    @IBOutlet weak var imageForShow: UIImageView!
    @IBOutlet weak var characterInfo: UILabel!
    
    let netflixShowsComponent = 0
    let characterComponent = 1
    
    var netflixShows = [String: [String]]()
    var netflixSeries = [String]()
    var characters = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // URL for our plist
        if let pathURL = Bundle.main.url(forResource: "netflixCharacters", withExtension: "plist"){
            //creates a property list decoder object
            let plistdecoder = PropertyListDecoder()
            do {
                let data = try Data(contentsOf: pathURL)
                //decodes the property list
                netflixShows = try plistdecoder.decode([String: [String]].self, from: data)
                netflixSeries = Array(netflixShows.keys)
                characters = netflixShows[netflixSeries[0]]! as [String]
            } catch {
                // handle error
                print(error)
            }
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == netflixShowsComponent {
            return netflixSeries.count
        } else {
            return characters.count
        }
    }
    
    //returns the title for the row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == netflixShowsComponent {
            return netflixSeries[row]
        } else {
            return characters[row]
        }
    }
    
    //Called when a row is selected
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //checks which component was picked
        if component == netflixShowsComponent {
            let selectedShow = netflixSeries[row] //gets the selected artist
            characters = netflixShows[selectedShow]! //gets the albums for the selected artist
            firstPicker.reloadComponent(characterComponent) //reload the album component
            firstPicker.selectRow(0, inComponent: characterComponent, animated: true) //set the album component back to 0
        }
        let showrow = pickerView.selectedRow(inComponent: netflixShowsComponent) //gets the selected row for the artist
        let characterrow = pickerView.selectedRow(inComponent: characterComponent) //gets the selected row for the album
        characterInfo.text = "Your favorite character is \(characters[characterrow]) from \(netflixSeries[showrow])!"
        imageForShow.image = UIImage(named: "\(characters[characterrow])")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

