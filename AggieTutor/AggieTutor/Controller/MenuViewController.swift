//
//  MenuViewController.swift
//  AggieTutor
//
//  Created by DollyYe on 11/21/18.
//  Copyright © 2018 Aggie Tutor. All rights reserved.
//

import UIKit
import Firebase
// A screen displaying two options: Log in / Sign up
class MenuViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // If the user is previously logged in, then skip menu screen and go to home screen.
        if Auth.auth().currentUser != nil {
            performSegue(withIdentifier: "toHomeScreen", sender: self)
        }
        
        view.addVerticalGradientLayer(topColor: secondaryColor, bottomColor: primaryColor)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated);
        super.viewWillDisappear(animated)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        if Auth.auth().currentUser != nil {
            self.performSegue(withIdentifier: "toHomeScreen", sender: self)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .lightContent
        }
    }
}

