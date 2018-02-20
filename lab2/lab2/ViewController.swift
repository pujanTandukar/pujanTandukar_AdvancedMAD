//
//  ViewController.swift
//  lab2
//
//  Created by Pujan Tandukar on 2/19/18.
//  Copyright © 2018 Pujan Tandukar. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UISearchResultsUpdating {
    
    var myBooks = [String]()
    var myBooksFavWhy = [String]()
    var filteredBooks = [String]()
    var searchController = UISearchController()
    var resultController = UITableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Favorite Books"
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
//        navigationController?.navigationBar.prefersLargeTitles = true
        
        searchController = UISearchController(searchResultsController: resultController)
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchResultsUpdater = self
        
        resultController.tableView.delegate = self
        resultController.tableView.dataSource = self
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filteredBooks = myBooks.filter({ (myBooks:String) -> Bool in
            if myBooks.contains(searchController.searchBar.text! ){
                return true
            }
            else{
                return false
            }
        })
        resultController.tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func preparetounwind(_ segue: UIStoryboardSegue){
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    //Required methods for UITableViewDataSource
    //Number of rows in the section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(tableView == resultController.tableView){
            return filteredBooks.count
        }
        else{
            return myBooks.count
        }
    }
    
    // Displays table view cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //configure the cell
//        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
//        let cell = UITableViewCell()
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else {
            return UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        }
        
        if(tableView == resultController.tableView){
            cell.textLabel?.text = filteredBooks[indexPath.row]
        }
        else{
            cell.textLabel?.text = myBooks[indexPath.row]
            cell.detailTextLabel?.text = myBooksFavWhy[indexPath.row]
        }
        return cell;
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //Delete the country from the array
            myBooks.remove(at: indexPath.row)
            // Delete the row from the table
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "moreInfo"{
            let infoVC = segue.destination as! bookMoreInfoController
            let editingCell = sender as! UITableViewCell
            let indexPath = tableView.indexPath(for: editingCell)
            infoVC.myBookAuthorInfo = myBooks[indexPath!.row]
            infoVC.myBookInfo = myBooksFavWhy[indexPath!.row]
//            let countries = myBooks[infoVC.myBookInfo]! as [String]
//            let countries = continentList.continentData[infoVC.name]! as
        }
    }
    
    @IBAction func unwindSegue (_ segue:UIStoryboardSegue){
        if(segue.identifier=="saveUnwind"){
            let source = segue.source as! addBooks
            if((source.addBook.isEmpty) == false){
                myBooks.append(source.addBook)
                myBooksFavWhy.append(source.addBookFav)
                tableView.reloadData()
            }
        }
    }
}

