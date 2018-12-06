//
//  ExistedCourseViewController.swift
//  AggieTutor
//
//  Created by ruolan zeng on 11/27/18.
//  Copyright © 2018 Aggie Tutor. All rights reserved.
//

import UIKit

class ExistedCourseViewController: UIViewController {

    
    var inputData:Course!
    
    @IBOutlet weak var course: UITextField!
    @IBOutlet weak var quarterCompleted: UITextField!
    @IBOutlet weak var professor: UITextField!
    @IBOutlet weak var grade: UITextField!
    @IBOutlet weak var reasons: UITextField!
    @IBOutlet weak var hourrate: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        course.text = inputData.course_name
        quarterCompleted.text = inputData.quarter
        professor.text = inputData.instructor
        grade.text = inputData.grade
        reasons.text = inputData.reason
        hourrate.text = String(inputData.hourly_wage)
    }

}
