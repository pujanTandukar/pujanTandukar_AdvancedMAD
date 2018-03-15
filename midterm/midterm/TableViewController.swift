//
//  TableViewController.swift
//  midterm
//
//  Created by Pujan Tandukar on 3/15/18.
//  Copyright © 2018 Pujan Tandukar. All rights reserved.
//

import UIKit
import RealmSwift

class TableViewController: UITableViewController, UISearchBarDelegate {
    
    var array = [restaurant]()
    var searchedArray = [restaurant]()
    var realmArray = [restaurants]()
    var searchedRealmArray = [restaurants]()
    
    var realm : Realm!
    var restaurantList: Results<restaurants> {
        get {
            return realm.objects(restaurants.self)
        }
    }
    
    @IBOutlet weak var restSearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        restSearchBar.delegate = self
        array.append(restaurant(name: "Luciles", url: "https://www.luciles.com/"))
        array.append(restaurant(name: "Ricon Argentina", url: "https://www.rinconargentinoboulder.com/"))
        array.append(restaurant(name: "Back Country Pizza", url: "https://www.backcountrypizzaandtaphouse.com/"))
        array.append(restaurant(name: "WestEnd Tavern", url: "https://www.thewestendtavern.com/"))
        searchedArray = array
        
        do {
            realm = try Realm()
        } catch let error {
            print(error.localizedDescription)
        }
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        self.restSearchBar.endEditing(true)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else{
            searchedArray = array
            tableView.reloadData()
            return
        }
        
        searchedArray = array.filter({rests -> Bool in
            guard let text = searchBar.text else { return false }
            return rests.name.lowercased().contains(text.lowercased())
        })
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return array.count
        return searchedArray.count
//        return realmArray.count
    }

    @IBAction func unwindSegue(_ segue: UIStoryboardSegue){
        if segue.identifier == "saveSegue"{
            let source = segue.source as! ViewController
            if(source.restName.isEmpty == false){
                let newRestaurant = restaurant(name: source.restName, url: source.restURL)
                array.append(newRestaurant)
                searchedArray = array
                print(array)
                
                do{
                    try self.realm.write{
                        self.realm.add(source.realmRes)
                        realmArray.append(source.realmRes)
                        print("realm working?")
                        print(realmArray)
                    }
                } catch let error{
                    print(error.localizedDescription)
                }
            }
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = searchedArray[indexPath.row]
        cell.textLabel?.text = item.name
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let detailVC = segue.destination as! WebViewController
            let numberIndex = tableView.indexPath(for: sender as! UITableViewCell)!
            let myRestaurant = searchedArray[numberIndex.row]
            detailVC.title = myRestaurant.name
            detailVC.webpage = myRestaurant.url
        }
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            searchedArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
        }    
    }
}
