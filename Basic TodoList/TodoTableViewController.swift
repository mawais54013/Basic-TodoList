//
//  TodoTableViewController.swift
//  Basic TodoList
//
//  Created by muhammad Awais on 10/7/19.
//  Copyright © 2019 muhammad Awais. All rights reserved.
//

import UIKit

class TodoTableViewController: UITableViewController {
    
    var todos : [Todo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let todo1 = Todo()
        todo1.name = "Buy Milk"
        todo1.important = true
        
        let todo2 = Todo()
        todo2.name = "Walk the dog"
        todo2.important = false
        
        todos = [todo1, todo2]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let todo = todos[indexPath.row]
        
        if todo.important {
            cell.textLabel?.text = "❗️" + todo.name
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
        if let createVC = segue.destination as? CreateTodoViewController {
            createVC.todoTableVC = self
        }
        
        if let completeVC = segue.destination as? CompleteViewController {
            if let todo = sender as? Todo {
                completeVC.todo = todo
                completeVC.todoTableVC = self
            }
        }
    }

}
