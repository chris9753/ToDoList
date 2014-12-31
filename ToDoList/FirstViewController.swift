//
//  FirstViewController.swift
//  ToDoList
//
//  Created by Christopher Da Silva on 2014-12-31.
//  Copyright (c) 2014 Christopher Da Silva. All rights reserved.
//

import UIKit
 var toDoItems :[String] = []

class FirstViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet var tasksTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.count
        
        
    }
    
  
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.contentView.backgroundColor = UIColor.yellowColor()
        
        cell.textLabel.text = toDoItems[indexPath.row]
        return cell
    }
    override func viewWillAppear(animated: Bool) {
        
        //If the Permanent Object has Data clear the curent array
      
        if var storedToDoItems: AnyObject = NSUserDefaults.standardUserDefaults().objectForKey("toDoItems"){
            toDoItems=[]
            
            //Adding data to current array in the same order.
            
            for var i = 0;i < storedToDoItems.count ;i++ {
                
                toDoItems.append(storedToDoItems[i] as NSString)
            }
            
            }
        }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        
        if(editingStyle == UITableViewCellEditingStyle.Delete){
            
            toDoItems.removeAtIndex(indexPath.row)
            let fixedItems = toDoItems
            
            NSUserDefaults.standardUserDefaults().setObject(fixedItems, forKey: "toDoItems")
            NSUserDefaults.standardUserDefaults().synchronize()
            tasksTable.reloadData()

        }
        
     }
    }



