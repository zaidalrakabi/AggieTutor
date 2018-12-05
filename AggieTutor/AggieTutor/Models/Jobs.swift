//
//  Jobs.swift
//  AggieTutor
//
//  Created by Zaid Alrakabi on 12/3/18.
//  Copyright © 2018 Aggie Tutor. All rights reserved.
//

import Foundation
import Firebase

class Jobs{
    var name = ""
    var email = ""
    var status = ""
    
    init(job: DataSnapshot) {
        let jobval = job.value as? [String: Any] ?? [:]
        self.name = jobval["name"] as? String ?? ""
        self.email = jobval["email"] as? String ?? ""
        self.status = jobval["statis"] as? String ?? ""
        
        
    }
}
