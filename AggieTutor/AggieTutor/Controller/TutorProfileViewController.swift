//
//  TutorProfileViewController.swift
//  AggieTutor
//
//  Created by ruolan zeng on 11/27/18.
//  Copyright © 2018 Aggie Tutor. All rights reserved.
//

import UIKit

class TutorProfileViewController: UIViewController {
    
    @IBOutlet weak var GPA: UITextField!
    @IBOutlet weak var workHours: UITextField!
    @IBOutlet weak var language: UITextField!
    @IBOutlet weak var tutorInterest: UITextField!
    @IBOutlet weak var tutorStrategy: UITextField!
    
    @IBAction func saveChanges(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
