//
//  TodoTableViewController.swift
//  Basic TodoList
//
//  Created by muhammad Awais on 10/7/19.
//  Copyright © 2019 muhammad Awais. All rights reserved.
//

import UIKit

class TodoTableViewController: UITableViewController {
    
    var todos : [ToDoItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let coreDataToDoItems = try? context.fetch(ToDoItem.fetchRequest()) as? [ToDoItem] {
                todos = coreDataToDoItems
                tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let todo = todos[indexPath.row]
        
        if todo.important {
            if let name = todo.name {
                cell.textLabel?.text = "❗️" + name
            }
        }
        else
        {
            cell.textLabel?.text = todo.name
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedTodo = todos[indexPath.row]
        performSegue(withIdentifier: "goToComplete", sender: selectedTodo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let completeVC = segue.destination as? CompleteViewController {
            if let todo = sender as? ToDoItem {
                completeVC.todo = todo
            }
        }
    }

}
