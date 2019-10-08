//
//  CompleteViewController.swift
//  Basic TodoList
//
//  Created by muhammad Awais on 10/7/19.
//  Copyright © 2019 muhammad Awais. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {
    
    @IBOutlet weak var todoLabel: UILabel!
    var todo = Todo()
    var todoTableVC : TodoTableViewController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if todo.important {
            todoLabel.text = todo.name
        }
        else
        {
            todoLabel.text = "❗️" + todo.name
        }
    }
    
    @IBAction func completeTapped(_ sender: Any) {
        if let toDos = todoTableVC?.todos {
            var index = 0
            for x in toDos {
                if x.name == todo.name
                {
                    todoTableVC?.todos.remove(at: index)
                    todoTableVC?.tableView.reloadData()
                    navigationController?.popViewController(animated: true)
                    return 
                }
                index += 1
            }
        }
    }
}
