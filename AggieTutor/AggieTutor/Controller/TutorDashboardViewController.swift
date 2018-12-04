//
//  TutorDashboardViewController.swift
//  AggieTutor
//
//  Created by ruolan zeng on 11/27/18.
//  Copyright © 2018 Aggie Tutor. All rights reserved.
//

import UIKit
import Firebase

class TutorDashboardViewController: UICollectionViewController {
    
    @IBOutlet weak var addBarButtonItem: UIBarButtonItem!
    var databaseRefer: DatabaseReference!
    var datebaseHandle: DatabaseHandle!
    var courses = [Course]()
    var curCourses = [Course]()
    
    struct Storyboard {
        static let courseCell = "courseCell"
        static let leftAndRightPaddings: CGFloat = 2.0
        static let numberOfItemsPerRow: CGFloat = 3.0
        static let showDetailVC = "ShowCourseDetails"
    }
    
    // MARK: - get tutor courses for a user
    func getCourses(){
        databaseRefer = Database.database().reference()
        let dataRef = self.databaseRefer.child("users")
        let data2Ref = dataRef.child("jlsolorio")
        let query = data2Ref.child("teaching")
        
        query.observe(.value, with: { DataSnapshot in
            for child in DataSnapshot.children {
                let course = child as! DataSnapshot
                self.courses.append(Course(course: course))
                
                print("\(course)")
            }
            DispatchQueue.main.async {
                self.curCourses = self.courses
                self.collectionView.reloadData()
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // change the layout of the collection view
        let collectionViewWidth = collectionView?.frame.width
        let itemWidth = (collectionViewWidth! - Storyboard.leftAndRightPaddings) / Storyboard.numberOfItemsPerRow
        
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        navigationItem.rightBarButtonItems?.append(editButtonItem)
        
        getCourses()
        print("done loading")
    }
    
    // MARK: - number of courses
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(courses.count)
        return courses.count;
    }
    
    //MARK: - generate courses dashboard view
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.courseCell, for: indexPath) as! CourseCell
        
        cell.courseName.text! = courses[indexPath.item].course_name
        return cell
    }
    
    // MARK: - segue to selected course profile
    var name: String = ""
    var grade: String = ""
    var instructor: String = ""
    var reason: String = ""
    var quarter: String = ""
    var hourrate: Int = 0
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        name = courses[indexPath.item].course_name
        grade = courses[indexPath.item].grade
        instructor = courses[indexPath.item].instructor
        reason = courses[indexPath.item].reason
        quarter = courses[indexPath.item].quarter
        hourrate = courses[indexPath.item].hourly_wage
        performSegue(withIdentifier:Storyboard.showDetailVC, sender:nil)
    }
    
    // MARK: - Delete button effect
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        addBarButtonItem.isEnabled = !editing
        if let indexPaths = collectionView?.indexPathsForVisibleItems{
            for indexPath in indexPaths {
                if let cell = collectionView?.cellForItem(at: indexPath) as? CourseCell{
                    cell.isEditing = editing
                }
            }
        }
    }
    
    // MARK: - prepare the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.showDetailVC{
            let detailVC = segue.destination as! ExistedCourseViewController
            detailVC.course.text = name
            detailVC.quarterCompleted.text = quarter
            detailVC.grade.text = grade
            detailVC.professor.text = instructor
            detailVC.reasons.text = reason
            detailVC.hourrate.text = String(hourrate)
        }
    }
}
