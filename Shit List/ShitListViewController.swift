//
//  ViewController.swift
//  Shit List
//
//  Created by elroy jetson on 8/4/19.
//  Copyright © 2019 ideal. All rights reserved.
//

import UIKit

class ShitListViewController: UITableViewController {

    let itemArray = ["Kick Thom ass!", "Fuck Jim up!", "Bitch, better have my money!"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    //MARK: TableView Datasource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShitListItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    

}
