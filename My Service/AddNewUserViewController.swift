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
            
            uploadValueToServer(strURL: strMyURL)
            
            
            
        } // End if-else
        
        } // End saveButton method
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("This is AddNewUser screen!")

        // Do any additional setup after loading the view.
    } // End main method
    
    // Upload data to server
    func uploadValueToServer(strURL: String) -> Void {
        
        // Connect to HTTP
        let urlPHP = strURL
        //"androidthai.in.th"
        //"http://swiftcodingthai.com"
        // Change String to url String
        let myURL = URL(string: urlPHP)
        
        let request = NSMutableURLRequest(url: myURL!)
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
            
            if error != nil {
                print("Error !!!")
            } else {
                
                if let unwrappedData = data {
                    let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                    let strJSON = dataString as Any
                    print("strJSON ==> \(strJSON)")
                } // Inner if
                
            } // outer if-else
            
            
        }
        
        task.resume()
        
        // Go back to first screen after adding new record
        performSegue(withIdentifier: "BackHome", sender: "self")
        
    } // End uploadValue method

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goHome" {
            
            if let destination = segue.destination as? ViewController {
                
                destination.myString = (sender as? String)!
                
            }
            
        } // End if
        
        
    } // End prepare function
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
} // End main class
