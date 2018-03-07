//
//  SearchView.swift
//  Quotes
//
//  Created by James Motes on 3/3/18.
//  Copyright © 2018 JDM. All rights reserved.
//

import UIKit

class SearchView: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchResultsUpdating {
    
    var data : [String] = [String]()
    var filteredData : [String] = [String]()
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchString = searchController.searchBar.text
        
        filteredData.removeAll() // is mandatory to empty the filtered array
        for d in data {
            if d.lowercased().range(of:searchString!) != nil {
                filteredData.append(d)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        cell.textLabel?.text = filteredData[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        cell.backgroundColor = UIColor.black
        return cell
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        data.append(contentsOf: peopleOptions)
        data.append(contentsOf: catOptions)
        data.append(contentsOf: moodOptions)
        filteredData = data
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func backToMainMenu(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData.removeAll() // is mandatory to empty the filtered array
        if(searchText != "") {
            for d in data {
                if d.lowercased().contains(searchText.lowercased()) {
                    filteredData.append(d)
                }
            }
        }
        else {
            filteredData = data
        }
        tableView.reloadData()
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
