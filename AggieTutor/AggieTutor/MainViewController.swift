//
//  ViewController.swift
//  AggieTutor
//
//  Created by Zaid Alrakabi on 11/15/18.
//  Copyright © 2018 Aggie Tutor. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBAction func LoginSignUpPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "LoginSignUp", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LoginVC")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func JobTutorsPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "JobsTutors", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TutorsVC")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func ProfilePressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Profile", bundle: nil)
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

