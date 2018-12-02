//
//  ViewController.swift
//  AggieTutor
//
//  Created by Zaid Alrakabi on 11/15/18.
//  Copyright © 2018 Aggie Tutor. All rights reserved.
//

import UIKit
import Firebase

class MainViewController: UIViewController {
    
    @IBAction func handleLogOut(_ sender: Any) {
            try! Auth.auth().signOut()
            self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func DashboardPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Dashboard", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DashboardVC")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func JobTutorsPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "JobsTutors", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TutorsVC")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func ProfilePressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "ProfileStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ProfileVC")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func RequestsPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Request", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "RequestVC")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

