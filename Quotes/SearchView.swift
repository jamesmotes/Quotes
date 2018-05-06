//
//  SearchView.swift
//  Quotes
//
//  Created by James Motes on 3/3/18.
//  Copyright © 2018 JDM. All rights reserved.
//

import UIKit
import RealmSwift

var searchedSpecificQuote = false
var selectedSpecificQuote = false
var specificQuote : String = ""

class SearchView: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchResultsUpdating {
    
    var data : [String] = [String]()
    var filteredData : [String] = [String]()
    
    //@IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    let realm = try! Realm()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    /*
    func updateSearchResults(for searchController: UISearchController) {
        let searchString = searchController.searchBar.text
        
        filteredData.removeAll() // is mandatory to empty the filtered array
        for d in data {
            if d.lowercased().range(of:searchString!) != nil {
                filteredData.append(d)
            }
        }
        tableView.reloadData()
    }*/
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        filteredData = filteredData.sorted { $0.localizedCaseInsensitiveCompare($1) == ComparisonResult.orderedAscending }
        
        cell.textLabel?.text = filteredData[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        cell.backgroundColor = UIColor.black
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selected = filteredData[indexPath.row]
        
        if(searchedSpecificQuote){
            selectedSpecificQuote = true
            searchedSpecificQuote = false
            specificQuote = selected
            dismiss(animated: true, completion: nil)
        }
        
        
        if peopleOptions.contains(selected){
            pers = selected
        }
        else if catOptions.contains(selected) {
            category = selected
        }/*
        else if moodOptions.contains(selected){
            md = selected
        }*/
        dismiss(animated: true, completion: nil)
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if(!full_unlock){
//            performSegue(withIdentifier: "unlockSegue", sender: nil)
//        }
        
        data.append(contentsOf: peopleOptions)
        data.append(contentsOf: catOptions)
        //data.append(contentsOf: moodOptions)
        data.shuffle()
        filteredData = data
        filteredData = filteredData.sorted { $0.localizedCaseInsensitiveCompare($1) == ComparisonResult.orderedAscending }
        tableView.backgroundView?.backgroundColor = UIColor.black
        tableView.backgroundColor = UIColor.black
        
        //searchBar.barTintColor = UIColor.black
        tableView.sectionIndexTrackingBackgroundColor = UIColor.black
        tableView.sectionIndexBackgroundColor = UIColor.black
        
        let backView = UIView(frame: self.tableView.bounds)
        backView.backgroundColor = UIColor.black // or whatever color
        self.tableView.backgroundView = backView
        // Do any additional setup after loading the view.
        
        /*searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search..."
        navigationItem.searchController = searchController
        definesPresentationContext = true
        */
        
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        filteredData = filteredData.sorted { $0.localizedCaseInsensitiveCompare($1) == ComparisonResult.orderedAscending }
        tableView.tableHeaderView = searchController.searchBar
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        searchController.dismiss(animated: false, completion: nil)
    }
    
    
    @IBAction func backToMainMenu(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    /*
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
        tableView.backgroundView?.backgroundColor = UIColor.black
        tableView.backgroundColor = UIColor.black
        
        //searchBar.barTintColor = UIColor.black
        tableView.sectionIndexTrackingBackgroundColor = UIColor.black
        tableView.sectionIndexBackgroundColor = UIColor.black
        
        let backView = UIView(frame: self.tableView.bounds)
        backView.backgroundColor = UIColor.black // or whatever color
        self.tableView.backgroundView = backView
        // Do any additional setup after loading the view.
        
    }*/
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            filteredData = data.filter { query in
                return query.lowercased().contains(searchText.lowercased())
            }
            
        } else {
            filteredData = data
        }
        // sort alphabetically
        filteredData = filteredData.sorted { $0.localizedCaseInsensitiveCompare($1) == ComparisonResult.orderedAscending }
        
        if filteredData.count < 1{
            
            let query = "text CONTAINS '" + searchController.searchBar.text! + "'"
            let quotes = Array(realm.objects(Quote.self).filter(query))
            for q in quotes {
                filteredData.append(q.text)
            }
            searchedSpecificQuote = true
        }
        else {
            searchedSpecificQuote = false
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

/*extension SearchView: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        // TODO
    }
}*/
