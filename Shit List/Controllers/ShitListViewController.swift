//
//  ViewController.swift
//  Shit List
//
//  Created by elroy jetson on 8/4/19.
//  Copyright © 2019 ideal. All rights reserved.
//

import UIKit

class ShitListViewController: UITableViewController {

//    var itemArray = ["Kick Thom's ass!", "Fuck Jim up!", "Bitch, better have my money!"]
    var itemArray = [Items]()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var newItem = Items()
        newItem.title = "Kick Thom's ass!"
        itemArray.append(newItem)
        
        var newItem2 = Items()
        newItem2.title = "Fuck Jim up!"
        itemArray.append(newItem2)
        
        var newItem3 = Items()
        newItem3.title = "Bitch, better have my money!"
        itemArray.append(newItem3)
        
        var newItem4 = Items()
        newItem4.title = "Fuck 45!"
        itemArray.append(newItem4)
        
        if let items = defaults.array(forKey: "ShitListArray") as? [Items] {
            itemArray = items
        }
        
    }
    
    //MARK: TableView Datasource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShitListItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none
        
//        if item.done == true {
//            cell.accessoryType = .checkmark
//        } else {
//            cell.accessoryType = .none
//        }
        
        return cell
    }
    
     //MARK: TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
    //MARK: Add new item
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add a New MF'r!", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
//            print("Successs!")
//            print(textField.text!)
            
            var newItem = Items()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            self.defaults.set(self.itemArray, forKey: "ShitListArray")
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create Item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    

}

