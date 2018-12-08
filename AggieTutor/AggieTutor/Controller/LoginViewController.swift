//
//  LoginViewController.swift
//  AggieTutor
//
//  Created by DollyYe on 11/21/18.
//  Copyright © 2018 Aggie Tutor. All rights reserved.
//

import UIKit
import UIKit
import Firebase

class LoginViewController:UIViewController, UITextFieldDelegate {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    // Firebase authentication
    @IBAction func LogIn(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailField.text!, password: passwordField.text!) { user, error in
            if error != nil{
                
                print("Error logging in: \(error!.localizedDescription)")
                self.handleError(error!)
                return
            } else {
                
                
                self.performSegue(withIdentifier: "toHomeController", sender: self)
            }
        }
    }
    // display error message
    func handleError(_ error: Error) {
        if let errorCode = AuthErrorCode(rawValue: error._code) {
            print(errorCode.errorMessage)
            self.errorLabel.text = errorCode.errorMessage
        }
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
         self.hideKeyboardWhenTappedAround()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        emailField.becomeFirstResponder()

    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .lightContent
        }
    }
}
