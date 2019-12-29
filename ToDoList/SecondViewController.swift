//
//  SecondViewController.swift
//  ToDoList
//
//  Created by Marco Moscatiello on 29/10/2015.
//  Copyright © 2015 Marco Moscatiello. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    
    
    @IBOutlet var itemField: UITextField!
    
    @IBAction func addItem(sender: AnyObject) {
        
        toDoList.append(itemField.text!)
        
        itemField.text = ""
        
        //update the todolist in the storage
        
        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //tap outside the keyboard to close it
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
         self.view.endEditing(true)
        
    }
    
    //close the keyboard clicking the return button
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
    
        itemField.resignFirstResponder()
    
        return true
    
    }
    
    
}

