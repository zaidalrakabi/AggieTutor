//
//  TutorsViewController.swift
//  AggieTutor
//
//  Created by mac on 11/21/18.
//  Copyright © 2018 Aggie Tutor. All rights reserved.
//

import UIKit

class TutorsViewController: UIViewController {
    let tutors = [
        [
            "name" : "Jose Solorio",
            "hourly_rate" : 15,
            "class" : "ECS 10",
            "TA" : false,
            "grade" : "A"
        ],
        [
            "name" : "Antonio Solorio",
            "hourly_rate" : 13,
            "class" : "MAT 108",
            "TA" : true,
            "grade": nil
        ]
    ]
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func GoToJobs(_ sender: Any) {
        let storyboard = UIStoryboard(name: "JobsTutors", bundle: nil)
        let JobsVC = storyboard.instantiateViewController(withIdentifier: "JobsVC")
        self.navigationController?.pushViewController(JobsVC, animated: true)
    }
    
    @IBAction func AddTutorPost(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension TutorsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tutors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("Creating TableCell\n")
        let tutor = tutors[indexPath.row]
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
    
    func setTutor(tutor: [String: Any?]){
        //Get Name
        let name = tutor["name"] as? String
        TutorNameLabel.text = name ?? "<Error: NO_NAME>"
        //Get Rate
        let rate = tutor["hourly_rate"] as? Int ?? 0
        RateLabel.text = "Hourly Rate: $\(rate)"
        //Get Qualification
        let isTA = tutor["TA"] as? Bool ?? false
        var TA = "No"
        if (isTA) {
            TA = "Yes"
        }
        let grade = tutor["grade"] as? String ?? "N\\A"
        QualificationsLabel.text = "Grade: \(grade),   TA: \(TA)"
    }
}
