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
    
    @IBAction func resetPassword(_ sender: Any) {
            let forgotPasswordAlert = UIAlertController(title: "Forgot password?", message: "Enter email address", preferredStyle: .alert)
            forgotPasswordAlert.addTextField { (textField) in
                textField.placeholder = "Enter email address"
            }
            forgotPasswordAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            forgotPasswordAlert.addAction(UIAlertAction(title: "Reset Password", style: .default, handler: { (action) in
                let resetEmail = forgotPasswordAlert.textFields?.first?.text
                Auth.auth().sendPasswordReset(withEmail: resetEmail!, completion: { (error) in
                    DispatchQueue.main.async {
                        //Use "if let" to access the error, if it is non-nil
                        if let error = error {
                            let resetFailedAlert = UIAlertController(title: "Reset Failed", message: error.localizedDescription, preferredStyle: .alert)
                            resetFailedAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                            self.present(resetFailedAlert, animated: true, completion: nil)
                        } else {
                            let resetEmailSentAlert = UIAlertController(title: "Reset email sent successfully", message: "Check your email", preferredStyle: .alert)
                            resetEmailSentAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                            self.present(resetEmailSentAlert, animated: true, completion: nil)
                        }
                    }
                })
            }))
            //PRESENT ALERT
            self.present(forgotPasswordAlert, animated: true, completion: nil)
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
