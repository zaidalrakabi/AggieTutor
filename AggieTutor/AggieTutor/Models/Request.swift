//
//  Request.swift
//  AggieTutor
//
//  Created by Zaid Alrakabi on 12/6/18.
//  Copyright © 2018 Aggie Tutor. All rights reserved.
//

import Foundation
import Firebase

class Request{
    var rate = 0
    var course = ""
    
    init(request: DataSnapshot) {
        let rq = request.value as? [String: Any] ?? [:]
        self.rate = rq["can_afford"] as? Int ?? 0
        self.course = rq["course"] as? String ?? ""
    }
}
