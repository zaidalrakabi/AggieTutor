//
//  TutorDashboardViewController.swift
//  AggieTutor
//
//  Created by ruolan zeng on 11/27/18.
//  Copyright © 2018 Aggie Tutor. All rights reserved.
//

import UIKit

class TutorDashboardViewController: UICollectionViewController {
    
    struct Storyboard {
        static let courseCell = "CourseCell"
        static let leftAndRightPaddings: CGFloat = 2.0
        static let numberOfItemsPerRow: CGFloat = 3.0
        static let showDetailVC = "ShowCourseDetails"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // change the layout of the collection view
        let collectionViewWidth = collectionView?.frame.width
        let itemWidth = (collectionViewWidth! - Storyboard.leftAndRightPaddings) / Storyboard.numberOfItemsPerRow
        
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1;//courses.size()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.courseCell, for: indexPath) as! CourseCell
        
        cell.courseName.text! = "ECS189E"//"to-be-set": courses[indexPath.item].name
        return cell
    }
    
    // MARK: - segue to selected course profile
    //let selectedCourse: Course
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        /*
         selectedCourse = courses[indexPath.item]
         performSegue(withIdentifier:Storyboard.showDetailVC, sender:nil)
         */
        
    }
    
    // MARK: - prepare the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.showDetailVC{
            let detailVC = segue.destination as! ExistedCourseViewController
            //detailVC.course = selectedCourse
        }
    }
}
