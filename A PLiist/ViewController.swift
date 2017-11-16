//
//  ViewController.swift
//  A PLiist
//
//  Created by Cyberjaya 4 iTrain on 16/11/2017.
//  Copyright © 2017 ada_yc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var name: UILabel!
    @IBOutlet var company: UILabel!
    @IBOutlet var phoneNumber: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
   
        loadPlistDictionary()
        
        loadPlistStudent()
    }
    
    
    //create a function so that next time can str away call the fnc
    func loadPlistStudent() {
        
        //Point to the file.
        let myPlistPath = Bundle.main.path(forResource: "StudentPlist", ofType: "plist")
        
        //Grab content.
        if let arrayResult = NSArray(contentsOfFile: myPlistPath!) {
            
            //Loop results from the result Array
            //[String:String] this to tell the Swft that it is a Dictionary with
            //keyfield is String type and Value is String type
            //[[String:String]] meaning Array contains dictionary
            //! is unwrap the optional value
            // optional value is wrap to protect nil value crash
            for student in arrayResult as! [[String:String]] {
                
                let student_name = student["name"]
                print("Student Name is \(student_name!)")
            }
        }
        
    }

    //create a function so that next time can str away call the fnc

    func loadPlistDictionary() {
        
        //Point to the file.
        let myPlistPath = Bundle.main.path(forResource: "Property List", ofType: "plist")
        
        //Grab content.
        if let dictResult = NSDictionary(contentsOfFile: myPlistPath!) {
            
            /* //Loop all the result.
             for (key, value) in dictResult {
             
             print ("Key field is \(key) and value is \(value)")
             
             }
             */
            
            self.name.text = dictResult["name"] as? String
            self.company.text = "Company :\(dictResult["company"] as! String)"
            self.phoneNumber.text = dictResult["phoneNo"] as? String
            
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
 

}

