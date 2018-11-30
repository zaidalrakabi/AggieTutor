//
//  JobsViewController.swift
//  AggieTutor
//
//  Created by mac on 11/21/18.
//  Copyright © 2018 Aggie Tutor. All rights reserved.
//

import UIKit

class JobsViewController: UIViewController {

    let jobs = [
        [
            "name" : "Johny Cash",
            "hourly_budget" : 15,
            "class" : "ECS 10"
        ],
        [
            "name" : "Homer Simpson",
            "hourly_budget" : 1,
            "class" : "Spanish"
        ]
    ]
    @IBOutlet weak var tableView: UITableView!
   
    @IBAction func GoToTutors(_ sender: Any) {
        let storyboard = UIStoryboard(name: "JobsTutors", bundle: nil)
        let TutorsVC = storyboard.instantiateViewController(withIdentifier: "TutorsVC")
        self.navigationController?.pushViewController(TutorsVC, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension JobsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let job = jobs[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "JobCell") as! JobCell
        cell.setJobCell(job: job)
        return cell
    }
}

class JobCell: UITableViewCell {
    
    @IBOutlet weak var StudentNameLabel: UILabel!
    @IBOutlet weak var HourlyBudgetLabel: UILabel!
    @IBOutlet weak var ClassLabel: UILabel!
    func setJobCell(job: [String : Any?]){
        //Set Name
        let name = job["name"] as? String ?? "<Error: No Name>"
        StudentNameLabel.text = name

        //Set Budget
        let rate = job["hourly_budget"] as? Int ?? 0
        HourlyBudgetLabel.text = "Hourly Budget: $\(rate)"
        
        //Set Class
        let the_class = job["class"] as? String ?? "<Error: NO_CLASS>"
        ClassLabel.text = the_class
    }
}
