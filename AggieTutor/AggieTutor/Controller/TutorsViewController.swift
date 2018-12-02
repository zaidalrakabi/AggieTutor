//
//  TutorsViewController.swift
//  AggieTutor
//
//  Created by mac on 11/21/18.
//  Copyright © 2018 Aggie Tutor. All rights reserved.
//

import UIKit
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
        self.teaching = td["class"] as? String ?? ""
        self.TA = false
    }
}

class TutorsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var databaseRefer: DatabaseReference!
    var datebaseHandle: DatabaseHandle!
    
    let response = [
        [
            "name" : "Jose Solorio",
            "hourly_rate" : 15,
            "teaching" : "ECS 10",
            "TA" : false,
            "grade" : "A"
        ],
        [
            "name" : "Antonio Solorio",
            "hourly_rate" : 13,
            "teaching" : "MAT 108",
            "TA" : true,
            "grade": nil
        ],
        [
            "name" : "Peter Griffin",
            "hourly_rate" : 100,
            "teaching" : "ECS 154",
            "TA" : true,
            "grade": nil
        ]
    ]
    var tutors = [Tutor]()
    var curTutors = [Tutor]()
    
    @IBAction func GoToJobs(_ sender: Any) {
        let storyboard = UIStoryboard(name: "JobsTutors", bundle: nil)
        let JobsVC = storyboard.instantiateViewController(withIdentifier: "JobsVC")
        self.navigationController?.pushViewController(JobsVC, animated: true)
    }
    
    func getTutors(){
        databaseRefer = Database.database().reference()
        self.databaseRefer.child("tutors").observe(.value, with: { DataSnapshot in
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
       
        getTutors()
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
        cell.setTutor(tutor: tutor)
        return cell
    }
    
    
}

class TutorCell: UITableViewCell{
    @IBOutlet weak var TutorNameLabel: UILabel!
    @IBOutlet weak var RateLabel: UILabel!
    @IBOutlet weak var QualificationsLabel: UILabel!
    @IBOutlet weak var GoToDetails: UIButton!
    @IBOutlet weak var ClassLabel: UILabel!
    
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
