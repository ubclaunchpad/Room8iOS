//
//  ViewController.swift
//  Room8iOS
//
//  Created by Aziz Zaynutdinov on 11/10/18.
//  Copyright © 2018 Aziz Zaynutdinov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    
    @IBAction func loginAction(_ sender: Any) {
        performSegue(withIdentifier: "loginSegue", sender: self)
    }
    
    @IBAction func registerAction(_ sender: Any) {
        performSegue(withIdentifier: "registerSegue", sender: self)
    }
    
}

