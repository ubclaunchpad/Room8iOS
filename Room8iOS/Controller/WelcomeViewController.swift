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
    var viewControllers: [UIViewController]!
    var selectedIndex: Int = 0
    // MARK: TODO - CHANGE THIS TO WORK WITH ARRAYS OF UIBUTTONS
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet var containerView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        loginViewController = storyboard.instantiateViewController(withIdentifier: "login")
        registerViewController = storyboard.instantiateViewController(withIdentifier: "register")
        
        viewControllers = [loginViewController, registerViewController]
        buttons[selectedIndex].isSelected = true
        didPress(buttons[selectedIndex])
    }
    
    @IBAction func didPress(_ sender: UIButton) {
        let previousIndex = selectedIndex
        selectedIndex = sender.tag
        buttons[previousIndex].isSelected = false
        let previousVC = viewControllers[previousIndex]
        previousVC.willMove(toParent: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParent()
        sender.isSelected = true
        let vc = viewControllers[selectedIndex]
        addChild(vc)
        vc.view.frame = containerView.bounds
        containerView.addSubview(vc.view)
        vc.didMove(toParent: self)
        
    }
}

