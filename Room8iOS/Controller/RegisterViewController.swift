//
//  RegisterViewController.swift
//  Room8iOS
//
//  Created by Aziz Zaynutdinov on 11/10/18.
//  Copyright © 2018 Aziz Zaynutdinov. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class RegisterViewController: UIViewController {

    @IBOutlet var firstName: UITextField!
    @IBOutlet var lastName: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func registerFirebase(_ sender: Any) {
        SVProgressHUD.show()
        
        //Set up a new user on our Firebase database
        
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) { (user, error) in
            
            if error != nil {
                print(error!)
            } else {
                print("Registration Successful!")
                let userID = Auth.auth().currentUser!.uid
                self.createUser(uid: userID, firstName: self.firstName.text!, lastName: self.lastName.text!, email: self.email.text!)
                SVProgressHUD.dismiss()
            }
        }
    }
    
    // Creates a new user object in the "Users" child in Firebase
    func createUser(uid: String, firstName: String, lastName: String, email: String) {
    var ref: DatabaseReference!
    ref = Database.database().reference()
        
    let userRef: DatabaseReference = ref.child("Users").child(uid)
    
        userRef.setValue(["Uid": uid,
                          "FirstName": firstName,
                          "LastName": lastName,
                          "Email": email])
    }
    
    
}
