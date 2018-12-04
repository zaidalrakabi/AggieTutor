//
//  ProfileViewController.swift
//  AggieTutor
//
//  Created by Zaid Alrakabi on 12/1/18.
//  Copyright © 2018 Aggie Tutor. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {

    @IBAction func EditPressed(_ sender: Any) {
    }
    @IBAction func BackPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Auth.auth().currentUser != nil {
            userName.text = Auth.auth().currentUser?.displayName
            email.text = Auth.auth().currentUser?.email
        }
        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
