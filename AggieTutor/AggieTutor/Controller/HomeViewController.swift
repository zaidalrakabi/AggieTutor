//
//  HomeViewController.swift
//  AggieTutor
//
//  Created by doMore on 11/27/18.
//  Copyright © 2018 Aggie Tutor. All rights reserved.
//
import Foundation
import UIKit
import Firebase

class HomeViewController:UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func handleLogout(_ sender:Any) {
        try! Auth.auth().signOut()
        self.dismiss(animated: false, completion: nil)
    }
}
