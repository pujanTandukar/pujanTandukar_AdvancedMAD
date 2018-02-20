////
////  bookSearchController.swift
////  lab2
////
////  Created by Pujan Tandukar on 2/20/18.
////  Copyright © 2018 Pujan Tandukar. All rights reserved.
////
//
//import UIKit
//
//class bookSearchController: UITableViewController, UISearchResultsUpdating {
//    
//    var allbooks = [String]()
//    var filteredbooks = [String]()
//   
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        //register our table cell identifier
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellIdentifier")
//    }
//    
//    func updateSearchResults(for searchController: UISearchController) {
//        let searchString = searchController.searchBar.text
////        filteredbooks.removeAll(keepingCapacity: true)
//        if searchString?.isEmpty == false {
//            let searchfilter: (String) -> Bool = { name in
//                let range = name.range(of: searchString!, options: .caseInsensitive)
//                print("Printing 123")
//                return range != nil
//            }
//            
//            let matches = allbooks.filter(searchfilter)
//            print("ADDED ONE")
//            filteredbooks.append(contentsOf: matches)
//        }
//        tableView.reloadData() //reload table data with search results
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    // MARK: - Table view data source
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return filteredbooks.count
//    }
//    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
//        cell.textLabel?.text = filteredbooks[indexPath.row]
//        return cell
//    }
//}
//
