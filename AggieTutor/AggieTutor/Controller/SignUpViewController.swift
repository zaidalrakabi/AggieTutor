//
//  SignUpViewController.swift
//  AggieTutor
//
//  Created by doMore on 11/21/18.
//  Copyright © 2018 Aggie Tutor. All rights reserved.
//
import Foundation
import UIKit
import  Firebase

class SignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
    
        self.hideKeyboardWhenTappedAround()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        usernameField.becomeFirstResponder()
        
    }
    
    
    @IBAction func SignUp(_ sender: Any) {
        
        Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!) {
            (user, error) in
            if error != nil {
                print(error!)
                self.handleError(error!)      // use the handleError method
            } else {
                print("Sign up successfully")
                self.performSegue(withIdentifier: "toMainController", sender: self)
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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .lightContent
        }
    }
    
}
