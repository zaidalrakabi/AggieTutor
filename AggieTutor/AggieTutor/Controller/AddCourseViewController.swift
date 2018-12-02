//
//  AddCourseViewController.swift
//  AggieTutor
//
//  Created by ruolan zeng on 11/27/18.
//  Copyright © 2018 Aggie Tutor. All rights reserved.
//

import UIKit

class AddCourseViewController: UIViewController {

    @IBOutlet weak var courseName: UITextField!
    @IBOutlet weak var quarterCompleted: UITextField!
    @IBOutlet weak var professor: UITextField!
    @IBOutlet weak var grade: UITextField!
    @IBOutlet weak var reasons: UITextField!
    
    @IBAction func Submit(_ sender: UIButton) {
        //generate a course information json and add it to the user profile
        //go back to the dashboard and reload it
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
