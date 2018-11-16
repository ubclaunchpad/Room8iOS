//
//  LoginViewController.swift
//  Room8iOS
//
//  Created by Aziz Zaynutdinov on 11/10/18.
//  Copyright © 2018 Aziz Zaynutdinov. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class LoginViewController: UIViewController {
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var addProfilePicture: UIButton!
    @IBOutlet var loginButton: UIButton!
    
    @IBAction func loginFirebase(_ sender: Any) {
        
        SVProgressHUD.show()
     
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            
            if error != nil {
                print(error!)
            } else {
                print("Log in successful!")
                
                SVProgressHUD.dismiss()
                
            }
            
        }
    }
    
    @IBAction func addProfileButtonAction(_ sender: Any) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addProfilePicture.backgroundColor = .clear
        addProfilePicture.layer.cornerRadius = 5
        addProfilePicture.layer.borderWidth = 1
        addProfilePicture.layer.borderColor = UIColor.black.cgColor
        
        loginButton.backgroundColor = .clear
        loginButton.layer.cornerRadius = 5
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.black.cgColor    }
}
