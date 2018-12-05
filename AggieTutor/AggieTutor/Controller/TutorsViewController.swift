//
//  TutorsViewController.swift
//  AggieTutor
//
//  Created by mac on 11/21/18.
//  Copyright © 2018 Aggie Tutor. All rights reserved.
//

import UIKit
import FirebaseDatabase

class TutorsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var databaseRefer: DatabaseReference!
    var datebaseHandle: DatabaseHandle!
    var tutors = [Tutor]()
    var curTutors = [Tutor]()
    
    
    @IBAction func GoToJobs(_ sender: Any) {
        let storyboard = UIStoryboard(name: "JobsTutors", bundle: nil)
        let JobsVC = storyboard.instantiateViewController(withIdentifier: "JobsVC")
        self.navigationController?.pushViewController(JobsVC, animated: true)
    }
    
    func getTutors(){
        databaseRefer = Database.database().reference()
        let query = self.databaseRefer.child("users").queryOrdered(byChild: "tutor").queryEqual(toValue: true)
        query.observe(.value, with: { DataSnapshot in
            for child in DataSnapshot.children {
                let tutor = child as! DataSnapshot
                self.tutors.append(Tutor(tutor: tutor))
            }
                DispatchQueue.main.async{
                self.curTutors = self.tutors
                self.tableView.reloadData()
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(tutors.isEmpty){
            getTutors()
        }
        print("finished loading")
        // Do any additional setup after loading the view.
    }
}

extension TutorsViewController: UISearchBarDelegate{
    func matchesSearch(tutor:Tutor, searchText:String) -> Bool{
        if tutor.name.lowercased().contains(searchText.lowercased()){
            return true
        }
        else if tutor.teaching.lowercased().contains(searchText.lowercased()){
            return true
        }
        return false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            curTutors = tutors
        } else {
            curTutors = tutors.filter{matchesSearch(tutor: $0, searchText: searchText) }
        }
       
        self.tableView.reloadData()
    }
}

extension TutorsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return curTutors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("Creating TableCell\n")
        let tutor = curTutors[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TutorCell") as! TutorCell
        cell.navigationController = self.navigationController;
        cell.setTutor(tutor: tutor)
        
        return cell
    }
    
}

class TutorCell: UITableViewCell{
    @IBOutlet weak var TutorNameLabel: UILabel!
    @IBOutlet weak var RateLabel: UILabel!
    @IBOutlet weak var QualificationsLabel: UILabel!
    @IBOutlet weak var ClassLabel: UILabel!
    var navigationController:UINavigationController! = nil
    
    @IBAction func GoToDetails(_ sender: Any) {
        let storyboard = UIStoryboard(name: "JobsTutors", bundle: nil)
        let VC = storyboard.instantiateViewController(withIdentifier: "TutorDetailVC") as! TutorCellDetailViewController
        VC.name = TutorNameLabel.text
        VC.hourlyRate = RateLabel.text
        VC.classTeaching = ClassLabel.text
        VC.qualifications = QualificationsLabel.text
        
        self.navigationController.pushViewController(VC, animated: true)
        
    }
    func setTutor(tutor: Tutor){
        //Get Name
        TutorNameLabel.text = tutor.name
        ClassLabel.text = tutor.teaching 
        //Get Rate
        let rate = tutor.hourly_wage
        RateLabel.text = "Hourly Rate: $\(rate)"
        //Get Qualification
        let isTA = tutor.TA
        var TA = "No"
        if (isTA) {
            TA = "Yes"
        }
        let grade = tutor.grade
        QualificationsLabel.text = "Grade: \(grade),   TA: \(TA)"
    }
    
}
