//
//  CourseCell.swift
//  AggieTutor
//
//  Created by ruolan zeng on 12/1/18.
//  Copyright © 2018 Aggie Tutor. All rights reserved.
//

import UIKit

class CourseCell: UICollectionViewCell {
    @IBOutlet weak var courseName: UILabel!
    
    @IBOutlet weak var deleteButtonBackgroundView: UIVisualEffectView!
    
    var courseNameText: String! {
        didSet{
            deleteButtonBackgroundView.layer.cornerRadius = deleteButtonBackgroundView.bounds.width / 2.0
            deleteButtonBackgroundView.layer.masksToBounds = true
            deleteButtonBackgroundView.isHidden = !isEditing
        }
    }
    
    var isEditing: Bool = false{
        didSet{
            deleteButtonBackgroundView.isHidden = !isEditing
        }
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        
    }
    
}
