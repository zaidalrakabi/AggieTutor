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
    var uid = ""
    var name = ""
    var email = ""
    var status = ""
    
    init(job: DataSnapshot) {
        let jb = job.value as? [String: Any] ?? [:]
        self.uid = jb["uid"] as? String ?? ""
        self.name = jb["name"] as? String ?? ""
        self.email = jb["email"] as? String ?? ""
        self.status = jb["status"] as? String ?? ""
        
    }
}
