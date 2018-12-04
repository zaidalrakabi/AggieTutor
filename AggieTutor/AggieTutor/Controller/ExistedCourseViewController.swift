//
//  ExistedCourseViewController.swift
//  AggieTutor
//
//  Created by ruolan zeng on 11/27/18.
//  Copyright © 2018 Aggie Tutor. All rights reserved.
//

import UIKit

class ExistedCourseViewController: UIViewController {

    @IBOutlet weak var course: UITextField!
    @IBOutlet weak var quarterCompleted: UITextField!
    @IBOutlet weak var professor: UITextField!
    @IBOutlet weak var grade: UITextField!
    @IBOutlet weak var reasons: UITextField!
    @IBOutlet weak var hourrate: UITextField!
    
    var courseIndex: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
