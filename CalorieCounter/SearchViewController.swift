//
//  SearchViewController.swift
//  CalorieCounter
//
//  Created by Mitchel on 4/9/16.
//  Copyright © 2016 Mitchel. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate  {

    @IBOutlet weak var searchBar: UISearchBar!
    
    let foodSearch = FoodSearchModel()
    var searchResults = [SearchResult]() {
        didSet {
            tableView.reloadData()
            print(searchResults.count)
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchBarSearchButtonClicked( _ searchBar: UISearchBar)
    {
        foodSearch.search(searchBar.text!) { data in
            self.searchResults = data
        }
        
        view.endEditing(true)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchcell", for: indexPath)
        cell.textLabel?.text = searchResults[indexPath.row].name
        cell.textLabel?.font = Theme.Fonts.listFont.font
        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        let newScreen = segue.destination as? ResultViewController
        if newScreen != nil {
            print("only on results")
        }
      
        // Pass the selected object to the new view controller.
    }


}
