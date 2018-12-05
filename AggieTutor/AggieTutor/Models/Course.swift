//
//  Course.swift
//  AggieTutor
//
//  Created by ruolan zeng on 12/2/18.
//  Copyright © 2018 Aggie Tutor. All rights reserved.
//

import Foundation
import FirebaseDatabase

class Course {
    
    var course_name = ""
    var hourly_wage = 0
    var grade = ""
    var quarter = ""
    var reason = ""
    var instructor = ""
    
    init(){
        
    }
    
    init(course: DataSnapshot) {
        let td = course.value as? [String: Any] ?? [:]
        self.course_name = td["course_name"] as? String ?? ""
        self.hourly_wage = td["hourly_rate"] as? Int ?? 0
        self.grade = td["grade"] as? String ?? ""
        self.quarter = td["quater_completed"] as? String ?? ""
        self.reason = td["reasons_competent"] as? String ?? ""
        self.instructor = td["Instructor"] as? String ?? ""
    }
}
