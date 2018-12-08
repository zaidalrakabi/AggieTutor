//
//  InitialViewController.swift
//  AggieTutor
//
//  Created by DollyYe on 11/21/18.
//  Copyright © 2018 Aggie Tutor. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class InitialViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Auth.auth().currentUser != nil {
            self.performSegue(withIdentifier: "toHomeScreen", sender: self)
        }
        
        //Check if user is authenticated. If so, segue to the HomeViewController, otherwise, segue to the MenuViewController
        else {
            self.performSegue(withIdentifier: "toMenuScreen", sender: self)
        }
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .lightContent
        }
    }
}
