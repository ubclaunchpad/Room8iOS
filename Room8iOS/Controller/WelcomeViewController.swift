//
//  ViewController.swift
//  Room8iOS
//
//  Created by Aziz Zaynutdinov on 11/10/18.
//  Copyright © 2018 Aziz Zaynutdinov. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var loginViewController: UIViewController!
    var registerViewController: UIViewController!
    // MARK: TODO - CHANGE THIS TO WORK WITH ARRAYS OF UIBUTTONS
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var registerButton: UIButton!
    
    @IBOutlet var containerView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        loginViewController = storyboard.instantiateViewController(withIdentifier: "login")
        registerViewController = storyboard.instantiateViewController(withIdentifier: "register")
        
        loginButton.isSelected = true
        didPressLogin(loginButton)
    }
    
    @IBAction func didPressLogin(_ sender: UIButton) {
        registerButton.isSelected = false
        let previousVC = loginViewController
        previousVC?.willMove(toParent: nil)
        previousVC?.view.removeFromSuperview()
        previousVC?.removeFromParent()
        sender.isSelected = true
        loginViewController.view.frame = containerView.bounds
        containerView.addSubview(loginViewController.view)
        loginViewController.didMove(toParent: self)
    }
    
    @IBAction func didPressRegister(_ sender: UIButton) {
        loginButton.isSelected = false
        let previousVC = registerViewController
        previousVC?.willMove(toParent: nil)
        previousVC?.view.removeFromSuperview()
        previousVC?.removeFromParent()
        sender.isSelected = true
        registerViewController.view.frame = containerView.bounds
        containerView.addSubview(registerViewController.view)
        registerViewController.didMove(toParent: self)
    }
    
}

