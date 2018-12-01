//
//  LoginViewController.swift
//  AggieTutor
//
//  Created by doMore on 11/21/18.
//  Copyright © 2018 Aggie Tutor. All rights reserved.
//

import UIKit
import UIKit
import Firebase

class LoginViewController:UIViewController, UITextFieldDelegate {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
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
    func handleError(_ error: Error) {
        if let errorCode = AuthErrorCode(rawValue: error._code) {
            // now you can use the .errorMessage var to get your custom error message
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

    
    /**
     Adjusts the center of the **continueButton** above the keyboard.
     - Parameter notification: Contains the keyboardFrame info.
     */
    
    
   
    
    
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .lightContent
        }
    }
}
