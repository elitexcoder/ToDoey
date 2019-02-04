//
//  ViewController.swift
//  ToDoey
//
//  Created by JOHN G MARTIN on 2/3/19.
//  Copyright © 2019 JOHN G MARTIN. All rights reserved.
//  Example: How To Make A To Do List App and Setup DataBases For Persistent Data.

import UIKit

class TodoListViewController: UITableViewController {
    
    // Start of any properties, methods, etc that need to be initialized.
    var itemArray = ["Cards","Cup's And Balls","Magic Wand","Money"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    //MARK -- TableView DataSource Methods
    
    // NumberOfRowsInSelection - Method
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
        
    }
    
    // CellForRowAt -- Method
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
        
    }
    
    //MARK -- TableView Delegates
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        // Conditional to check if Item has been Checked Off or Not.
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        } // End of Conditional Statement.
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    } //End Of Func
    
    
    //MARK -- Add Items Code & Methods
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        // Vairbles needed for Scope.
        var textFiled = UITextField()
        
        // Create Alert Box IOS
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            self.itemArray.append(textFiled.text!)// Append data to Array and reloads Table.
            self.tableView.reloadData()
            
            
            
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Enter Data"
            textFiled = alertTextField
            
            
            
            
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
}// End Main Class

