//
//  AddNewUserViewController.swift
//  My Service
//
//  Created by Student04 on 6/15/2560 BE.
//  Copyright © 2560 SNRU. All rights reserved.
//

import UIKit

class AddNewUserViewController: UIViewController {
    
    // Field declaration
    var nameString: String? = nil
    var userString: String? = nil
    var passwordString: String? = nil
    
    
    @IBOutlet weak var alertLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func saveButton(_ sender: Any) {
        // Get value from TextField
        nameString = nameTextField.text
        userString = userTextField.text
        passwordString = passwordTextField.text
        
        // check empty input
        let intName = nameString?.characters.count
        let intUser = userString?.characters.count
        let intPassword = passwordString?.characters.count
        
        if (intName == 0) || (intUser == 0) || (intPassword == 0) {
            // Have empty input
            print("Have empty input!!!")
            // Make warning message visible
            alertLabel.alpha = 1
        } else {
            print("No empty input!!!")
            // Make warning message invisible
            alertLabel.alpha = 0
            
            // Link for adding data in table on the server
            let strMyURL = "http://androidthai.in.th/snru/addUserSooksathit.php?isAdd=true&Name=" + nameString! + "&User=" + userString! + "&Password=" + passwordString!
            
            print("strMyURL ==> \(strMyURL)")
            
        } // End if-else
        
        } // End saveButton method
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("This is AddNewUser screen!")

        // Do any additional setup after loading the view.
    } // End main method

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
} // End main class
