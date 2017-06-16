//
//  ViewController.swift
//  My Service
//
//  Created by Student04 on 6/15/2560 BE.
//  Copyright © 2560 SNRU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Explicit field declaration
    var myString = ""
    var strUser:String? = nil
    var strPassword:String? = nil
    
    
    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!

    @IBOutlet weak var alartLabel: UILabel!
    
    
    @IBAction func loginButton(_ sender: Any) {
        
        // Get value from TextField
        strUser = userTextField.text
        strPassword = passwordTextField.text
        
        // Check empty field
        if (strUser?.characters.count == 0) || (strPassword?.characters.count == 0) {
            alartLabel.alpha = 1
        } else {
            alartLabel.alpha = 0
        }
        
        
    }   // End loginButton method
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    } // End main method
    
    func readJSON(strURL: String) -> Void {
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
                print("Error ==> \(String(describing: error))")
            } else {
                
                if let unwrappedData = data {
                    let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                    let strJSON = dataString as Any
                    print("strJSON ==> \(strJSON)")
                }
                
            } // outer if-else
            
            
        }
        
        task.resume()

        
        
    } // End readJSON method
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    } // End didReceiveMemoryWarning method


} // End main class

