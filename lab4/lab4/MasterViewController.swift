//
//  MasterViewController.swift
//  lab4
//
//  Created by Pujan Tandukar on 3/5/18.
//  Copyright © 2018 Pujan Tandukar. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var colors = [Colors]()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadjson()
    }
    
    func loadjson(){
        let urlPath = "https://gist.githubusercontent.com/jjdelc/1868136/raw/c9160b1e60bd8c10c03dbd1a61b704a8e977c46b/crayola.json"
        guard let url = URL(string: urlPath)
            else {
                print("url error")
                return
        }
        
        let session = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            guard statusCode == 200
                else {
                    print("file download error")
                    return
            }
            //download successful
            print("download complete")
            DispatchQueue.main.async {self.parsejson(data!)}
        })
        //must call resume to run session
        session.resume()
    }
    
    func parsejson(_ data: Data){
        do{
            let colorArray = try JSONDecoder().decode([Colors].self, from: data)
//            print(colorArray[0].name)
            for color in colorArray{
                colors.append(color)
            }
            print(colors[0])
        }
        catch{
            print("Error wit JSON: \(error)")
            return
        }
        //reload the table data after the json data has been downloaded
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let color = colors[indexPath.row]
                let colorName = color.name
                let colorHex = color.hex
                let colorRGB = color.rgb
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.title = colorName
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
                controller.color = colorName
                controller.label = colorHex
                controller.rgb = colorRGB
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let object = colors[indexPath.row]
        cell.textLabel!.text = object.name
        cell.detailTextLabel!.text = object.hex
        return cell
    }
}

