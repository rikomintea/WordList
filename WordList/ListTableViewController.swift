//
//  ListTableViewController.swift
//  WordList
//
//  Created by スマート・ナビ on 2021/05/14.
//

import UIKit


class ListTableViewController: UITableViewController {

    var wordArray:[Dictionary<String,String>] = []
    
    let saveData = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 70
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if saveData.array(forKey: "WORD") != nil{
            wordArray = saveData.array(forKey: "WORD")as![Dictionary<String,String>]
        }
        tableView.reloadData()
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordArray.count
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as!ListTableViewCell
            
            let nowIndexPathDictionary = wordArray[indexPath.row]
            
            cell.englishLabel.text = nowIndexPathDictionary["english"]
            cell.japaneseLabel.text = nowIndexPathDictionary["jaoanese"]
            
            return cell
    }
           
        
}
