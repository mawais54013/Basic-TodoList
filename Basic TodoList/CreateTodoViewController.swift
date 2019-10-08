//
//  CreateTodoViewController.swift
//  Basic TodoList
//
//  Created by muhammad Awais on 10/7/19.
//  Copyright © 2019 muhammad Awais. All rights reserved.
//

import UIKit

class CreateTodoViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addTapped(_ sender: Any) {
        let newTodo = Todo()
        
        if let name = nameTextField.text {
            newTodo.name = name
            newTodo.important = importantSwitch.isOn
        }
    }

}
