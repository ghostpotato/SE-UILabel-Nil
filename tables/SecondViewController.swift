//
//  SecondViewController.swift
//  todo
//
//  Created by ghostpotato on 5/22/16.
//  Copyright © 2016 ghostpotato. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var desc: UITextField!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var dateString = String()
    
    func convertDatePicker() {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "hh:mm"
        dateString = dateFormatter.stringFromDate(datePicker.date)
        let index = dateString.startIndex.advancedBy(0)
        if dateString[index] == "0" {
            dateString = String(dateString.characters.dropFirst())
        }
    }
    
    @IBAction func save(sender: AnyObject) {
        if isEdit == true {
            convertDatePicker()
            if name.text!.isEmpty {
                listOfTasks.removeAtIndex(cellNum)
                listOfTasks.append([name.text!,desc.text!,dateString])
                isEdit = false
            }
        } else {
            convertDatePicker()
            if name.text!.isEmpty {
                listOfTasks.append([name.text!,desc.text!,dateString])
            }
        }
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject!) -> Bool {
        if identifier == "Second" {
            if (name.text!.isEmpty) {
                
                let alertController = UIAlertController(title: "Add a name!", message: "", preferredStyle: .Alert)
                
                let yesAlert = UIAlertAction(title: "OK", style: .Default, handler: nil)
                
                alertController.addAction(yesAlert)
                
                self.presentViewController(alertController, animated: true, completion: nil)
                
                listOfTasks.removeLast()
                
                return false
            
            } else {
                
                return true
            }
        }
        
        // by default, transition
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if isEdit == true {
            topLabel.text = "Edit this item"
            name.text = listOfTasks[cellNum][0]
            desc.text = listOfTasks[cellNum][1]
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

