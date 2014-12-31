//
//  SecondViewController.swift
//  ToDoList
//
//  Created by Christopher Da Silva on 2014-12-31.
//  Copyright (c) 2014 Christopher Da Silva. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITextFieldDelegate {
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var toDoItem: UITextField!
    
    @IBAction func addItem(sender: AnyObject) {
        
        toDoItems.append(toDoItem.text)
        
        //Persistent Storage 
        let fixedItems = toDoItems
        
        //setting Added Data from toDoItems[one at a time] to a permanent object
        
        NSUserDefaults.standardUserDefaults().setObject(fixedItems, forKey: "toDoItems")
        
        
       //Synchronizing/saving
        NSUserDefaults.standardUserDefaults().synchronize()
        
        
        self.view.endEditing(true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
        
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        toDoItem.resignFirstResponder()
        return true
        
    }

}

