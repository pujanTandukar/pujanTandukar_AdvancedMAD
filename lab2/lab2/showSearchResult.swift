//
//  showSearchResult.swift
//  lab2
//
//  Created by Pujan Tandukar on 2/20/18.
//  Copyright © 2018 Pujan Tandukar. All rights reserved.
//

import UIKit

class showSearchResult: UITableViewController {
    
    var words = [String]()
    var sController : UISearchController!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let resultsController = bookSearchController()
        resultsController.allbooks = words
        sController = UISearchController(searchResultsController: resultsController)
        
        sController.searchBar.placeholder = "Search"
        sController.searchBar.sizeToFit()
        tableView.tableHeaderView=sController.searchBar
        sController.searchResultsUpdater = resultsController
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    //Required methods for UITableViewDataSource
    //Number of rows in the section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    // Displays table view cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //dequeues an existing cell if one is available, or creates a new one and adds it to the table
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        cell.textLabel?.text = words[indexPath.row]
        return cell
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
