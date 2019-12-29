//
//  FirstViewController.swift
//  ToDoList
//
//  Created by Marco Moscatiello on 29/10/2015.
//  Copyright © 2015 Marco Moscatiello. All rights reserved.
//

import UIKit

var toDoList = [String]()


class FirstViewController: UIViewController, UITableViewDelegate{
    
    
    @IBOutlet var viewTableList: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil {
        
            //save the todolist in permanent storage
            toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! [String]
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toDoList.count
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
    
        cell.textLabel?.text = toDoList[indexPath.row]
        return cell
        
    }
    
    //delete a row in the tablelist with a swipe
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete{
            toDoList.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
        }
        
        viewTableList.reloadData()
        
    }
    

    override func viewDidAppear(animated: Bool) {
        
        viewTableList.reloadData()
        
    }
    
}

