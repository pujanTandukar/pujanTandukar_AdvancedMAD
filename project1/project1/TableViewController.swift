//
//  TableViewController.swift
//  project1
//
//  Created by Pujan Tandukar on 3/7/18.
//  Copyright © 2018 Pujan Tandukar. All rights reserved.
//

import UIKit
import RealmSwift

class TableViewController: UITableViewController, UISearchBarDelegate {

    var realm : Realm!
    var memoryList: Results<Memory> {
        get {
            return realm.objects(Memory.self)
        }
    }

    var myMemories = [Memory]()
    var allMem = [myMemo]()
    var currentMem1 = [myMemo]()
    
    @IBOutlet weak var memSearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(TableViewController.dismissKeyboard))
//        view.addGestureRecognizer(tap)
        do {
            realm = try Realm()
        } catch let error {
            print(error.localizedDescription)
        }
        
        memSearchBar.delegate = self
        tableView.reloadData()
        print(memoryList)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        self.memSearchBar.endEditing(true)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else{
            allMem = currentMem1
            tableView.reloadData()
            return
        }
        
        allMem = currentMem1.filter({memory -> Bool in
            guard let text = searchBar.text else { return false }
            return memory.emotion.lowercased().contains(text.lowercased())
        })
        tableView.reloadData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allMem.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let item = allMem[indexPath.row]
        cell.memoryNameLabel.text = item.emotion
        cell.memoryNameLabel.textColor = item.color
        cell.memoryDescriptionLabel.text = item.name
        cell.memoryImageView.image = item.image
        cell.memoryImageView.contentMode = .scaleAspectFit
        cell.memoryImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleBottomMargin, .flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin]
        cell.memoryImageView.clipsToBounds = true
        cell.memoryImageView.layer.cornerRadius = 4
        cell.memoryImageView.layer.borderColor = (item.color.cgColor)
        cell.memoryDateLabel.text = item.date
        
        
//        cell.memoryNameLabel.text = currentMem[indexPath.row]
//        cell.memoryNameLabel.textColor = colorName[indexPath.row]
//        cell.memoryDescriptionLabel.text = desName[indexPath.row]
//        cell.memoryImageView.image = imgName[indexPath.row]
//        cell.memoryImageView.contentMode = .scaleAspectFit
//        cell.memoryImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleBottomMargin, .flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin]
//        cell.memoryImageView.clipsToBounds = true
//        cell.memoryImageView.layer.cornerRadius = 4
//        cell.memoryImageView.layer.borderColor = (colorName[indexPath.row].cgColor)
//        cell.memoryDateLabel.text = dateName[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMeMemory"{
            let deatilMemory = segue.destination as! MemoryViewController
            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)!
            let item = allMem[indexPath.row]
            deatilMemory.dateDetails = item.date
            deatilMemory.emotionDetails = item.emotion
            deatilMemory.descriptionDetails = item.description
            deatilMemory.imageDetails = item.image
            deatilMemory.colorDetail = item.color
            deatilMemory.title = item.name
        }
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue){
        if(segue.identifier=="saveSegue"){
            let source = segue.source as! ViewController
            if((source.nameField.isEmpty) == false && source.descriptionField.isEmpty == false){
                currentMem1.append(source.newItem1)
                allMem = currentMem1
            
                do{
                    try self.realm.write{
                        self.realm.add(source.newMem)
                        myMemories.append(source.newMem)
                        print("REALM DATA ADDED")
                        print(Realm.Configuration.defaultConfiguration.fileURL!)
                    }
                } catch let error{
                    print(error.localizedDescription)
                }
                
                tableView.reloadData()
                print("Success 3")
            }
        }
    }
}
