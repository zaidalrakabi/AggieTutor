//
//  SignUpViewController.swift
//  AggieTutor
//
//  Created by DollyYe on 11/21/18.
//  Copyright © 2018 Aggie Tutor. All rights reserved.
//
import Foundation
import UIKit
import FirebaseAuth
import FirebaseDatabase

class SignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    var ref: DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initiate firebase
        ref = Database.database().reference()
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
    
    // Sign up: save user name, email, password to Firebase
    @IBAction func SignUp(_ sender: Any) {
        Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!) {
            (user, error) in
            if error != nil {
                print(error!)
                self.handleError(error!)
            } else {
                print("Sign up successfully")
                DispatchQueue.main.async {
                    let uID = Auth.auth().currentUser!.uid
                    self.ref.child("users").child(uID).setValue([
                        "username" : self.usernameField.text!,
                        "hourly_rate": 0,
                        "name": "NOT_SET"
                        ])
                }
                self.performSegue(withIdentifier: "toMainController", sender: self)
            }
         
                
            
        }
    }
    func handleError(_ error: Error) {
        if let errorCode = AuthErrorCode(rawValue: error._code) {
    
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
