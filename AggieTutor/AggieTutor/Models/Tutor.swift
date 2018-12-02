//
//  Tutor.swift
//  AggieTutor
//
//  Created by mac on 12/1/18.
//  Copyright © 2018 Aggie Tutor. All rights reserved.
//

import Foundation
import FirebaseDatabase

class Tutor {
    var name = ""
    var hourly_wage = 0
    var teaching = ""
    var grade = ""
    var TA = false
    init(tutor: DataSnapshot) {
        let td = tutor.value as? [String: Any] ?? [:]
        self.name = td["name"] as? String ?? ""
        self.hourly_wage = td["hourly_rate"] as? Int ?? 0
        
        let classes = tutor.childSnapshot(forPath: "teaching").value as? [String:[String:Any]] ?? [:]
        var count = 0
        for course in classes.values{
            if count > 0 {
                teaching.append(", ")
            }
            teaching.append(course["course_name"] as? String ?? "")
            count += 1
        }
        self.TA = false
    }
}
