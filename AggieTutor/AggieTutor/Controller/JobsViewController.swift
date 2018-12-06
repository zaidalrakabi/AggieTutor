//
//  JobsViewController.swift
//  AggieTutor
//
//  Created by mac on 11/21/18.
//  Copyright © 2018 Aggie Tutor. All rights reserved.
//

import UIKit
class Job{
    var name = ""
    var hb = 0
    var seekingHelp = ""
    init(name:String, hb:Int, seekingHelp:String) {
        self.name = name
        self.hb = hb
        self.seekingHelp = seekingHelp
    }
}
class JobsViewController: UIViewController {
    var jobs = [Job]()
    var curJobs = [Job]()
    let response = [
        [
            "name" : "Johny Cash",
            "hourly_budget" : 15,
            "class" : "ECS 10"
        ],
        [
            "name" : "Homer Simpson",
            "hourly_budget" : 1,
            "class" : "SPA 142"
        ]
    ]
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBAction func GoToTutors(_ sender: Any) {
        let storyboard = UIStoryboard(name: "JobsTutors", bundle: nil)
        let TutorsVC = storyboard.instantiateViewController(withIdentifier: "TutorsVC")
        self.navigationController?.pushViewController(TutorsVC, animated: true)
    }
    func getJobs(){
        for job in response {
            let name = job["name"] as? String ?? ""
            let hb = job["hourly_budget"] as? Int ?? 0
            let sh = job["class"] as? String ?? ""
            jobs.append(Job(name: name, hb: hb, seekingHelp: sh))
        }
        curJobs = jobs
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer(topColor: secondaryColor, bottomColor: primaryColor)
        getJobs()
    }
}

extension JobsViewController: UISearchBarDelegate{
    func matchSearch(job: Job, searchText: String) -> Bool{
        if job.name.lowercased().contains(searchText.lowercased()){
            return true
        } else if job.seekingHelp.lowercased().contains(searchText.lowercased()){
            return true
        }
        return false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            curJobs = jobs
        } else {
            curJobs = jobs.filter{matchSearch(job: $0, searchText: searchText)}
        }
        self.tableView.reloadData()
    }
}

extension JobsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return curJobs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let job = curJobs[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "JobCell") as! JobCell
        cell.setJobCell(job: job)
        return cell
    }
}

class JobCell: UITableViewCell {
    
    @IBOutlet weak var StudentNameLabel: UILabel!
    @IBOutlet weak var HourlyBudgetLabel: UILabel!
    @IBOutlet weak var ClassLabel: UILabel!
    func setJobCell(job: Job){
        //Set Name
        StudentNameLabel.text = job.name

        //Set Budget
        let rate = job.hb
        HourlyBudgetLabel.text = "Hourly Budget: $\(rate)"
        
        //Set Class
        ClassLabel.text = job.seekingHelp
    }
}
