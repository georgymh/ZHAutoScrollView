//
//  ViewController.swift
//  Scrollable Form
//
//  Created by Georgy Marrero on 6/4/15.
//  Copyright (c) 2015 Georgy Marrero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Outlet to the Scroll View with the ZHAutoScrollView class.
    @IBOutlet weak var autoScrollView: ZHAutoScrollView!
    
    // Outlet to the first textfield.
    @IBOutlet weak var usernameTextField: UITextField!
    
    // Outlet to the second textfield.
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
            The way ZHAutoScrollView works for Interface Builder storyboards is
            the following:
            
        
            - ZHAutoScrollView works as a UIScrollView, therefore, the UIScrollView
            inside the storyboard has to have the ZHAutoScrollView.swift file as its
            class.
        
            - ZHAutoScrollView has a UIView called contentView inside of its class,
            therefore, we do not need to create another UIView inside the UIScrollView
            inside the storyboard because this will make the UITextFields unworkable.
        
            - The TextFields have to be manually added as Subviews of ZHAutoScrollView
            in order for the class to manage all the Automatic Scrolling functionalities. 
            
            NOTE: To solve the ambiguous content width warning, at least one of the 
            Subviews of the ScrollView need to have the necessary constraints in order for 
            the ScrollView to know its maximum height and width. Some of the constraints 
            that work are the Top, Leading, Trailing, and Bottom.
        
        */
        
        // Linking the textField's with the ZHAutoScrollView (Necessary).
        let textFields : [UITextField] = [usernameTextField, passwordTextField]
    
        for field in textFields {
            autoScrollView.contentView.addSubview(field)
        }
        
        // Good to explicitly declare.
        autoScrollView.contentViewHasSameWidthWithScrollView = true
        //autoScrollView.contentViewHasSameHeightWithScrollView = true
        
        // Not necessary if you changed this on Storyboard.
        autoScrollView.userInteractionEnabled = true
        autoScrollView.bounces = true
        autoScrollView.scrollEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

