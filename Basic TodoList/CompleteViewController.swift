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
    var todo : ToDoItem? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        if todo != nil {
            if todo!.important {
                if let name = todo?.name {
                    todoLabel.text = "❗️" + name
                }            }
            else
            {
                todoLabel.text = todo!.name
            }
        }
    }
    
    @IBAction func completeTapped(_ sender: Any) {
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if todo != nil
            {
                context.delete(todo!)
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                navigationController?.popViewController(animated: true)
            }
        }

    }
}
