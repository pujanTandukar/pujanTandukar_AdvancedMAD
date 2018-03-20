//
//  TableViewController.swift
//  project1
//
//  Created by Pujan Tandukar on 3/7/18.
//  Copyright © 2018 Pujan Tandukar. All rights reserved.
//

import UIKit
import RealmSwift

class TableViewController: UITableViewController {

    var realm : Realm!
    var memoryList: Results<Memory> {
        get {
            return realm.objects(Memory.self)
        }
    }
    var memName = [String]()
    var extraDetailName = [String]()
    var desName = [String]()
    var imgName = [UIImage]()
    var dateName = [String]()
    var colorName = [UIColor]()
//    var myMemories = [Memory]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        
        do {
            realm = try Realm()
        } catch let error {
            print(error.localizedDescription)
        }
        
        tableView.reloadData()
        print("LoADING")
//        print(myMemories)
        print(memoryList)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return memName.count
//        return myMemories.count
        return memoryList.count
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
//        cell.memoryNameLabel.text = memName[indexPath.row]
//        cell.memoryNameLabel.textColor = colorName[indexPath.row]
//        cell.memoryDescriptionLabel.text = desName[indexPath.row]
//        cell.memoryImageView.image = imgName[indexPath.row]
//        cell.memoryImageView.contentMode = .scaleAspectFit
//        cell.memoryImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleBottomMargin, .flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin]
//        cell.memoryImageView.clipsToBounds = true
//        cell.memoryImageView.layer.cornerRadius = 4
//        cell.memoryImageView.layer.borderColor = (colorName[indexPath.row].cgColor)
//        cell.memoryDateLabel.text = dateName[indexPath.row]
        let item = memoryList[indexPath.row]
        cell.memoryNameLabel.text = item.emotion
        cell.memoryDescriptionLabel.text = item.name
        cell.memoryDateLabel.text = item.date
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
            let item = memoryList[indexPath.row]
            
            deatilMemory.dateDetails = item.date
            deatilMemory.emotionDetails = item.emotion
            deatilMemory.descriptionDetails = item.descriptions
            deatilMemory.title = item.name
            
//            deatilMemory.dateDetails = dateName[indexPath.row]
//            deatilMemory.emotionDetails = memName[indexPath.row]
//            deatilMemory.descriptionDetails = extraDetailName[indexPath.row]
////            deatilMemory.titleDetails = desName[indexPath.row]
//            deatilMemory.imageDetails = imgName[indexPath.row]
//            deatilMemory.colorDetail = colorName[indexPath.row]
//            deatilMemory.title = desName[indexPath.row]
        }
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue){
        if(segue.identifier=="saveSegue"){
            let source = segue.source as! ViewController
            if((source.nameField.isEmpty) == false && source.descriptionField.isEmpty == false){
                memName.append(source.nameField)
                desName.append(source.descriptionField)
                imgName.append(source.imageField)
                dateName.append(source.dateField)
                colorName.append(source.colorField)
                extraDetailName.append(source.extraDetailField)
//                myMemories.append(source.newMem)
                
                do{
                    try self.realm.write{
                        self.realm.add(source.newMem)
//                        myMemories.append(source.newMem)
                        print("REALM DATA ADDED")
                        print(Realm.Configuration.defaultConfiguration.fileURL!)
                    }
                } catch let error{
                    print(error.localizedDescription)
                }
                
                
                tableView.reloadData()
                print("Success 3")
                print(memName[0])
                print(desName[0])
            }
        }
    }
    
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
}
