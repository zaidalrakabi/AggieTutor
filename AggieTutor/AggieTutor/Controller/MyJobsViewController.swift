//
//  MyJobsViewController.swift
//  AggieTutor
//
//  Created by Zaid Alrakabi on 12/1/18.
//  Copyright © 2018 Aggie Tutor. All rights reserved.
//

import UIKit
import Firebase

class MyJobsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var databaseRefer: DatabaseReference!
    var databaseHandle: DatabaseHandle!
    var jobs = [Jobs]()
    var curJobs = [Jobs]()
    
    func getStudents(){
        databaseRefer = Database.database().reference()

        let uID = Auth.auth().currentUser!.uid
        let query = self.databaseRefer.child("users/\(uID)/Jobs/students")

        query.observe(.value, with: { (snapshot) in
            //print(snapshot.value ?? "nothing")
            
            if(!self.jobs.isEmpty){
                self.jobs.removeAll()
            }
            
            
            for child in snapshot.children{
                let job = child as! DataSnapshot
                self.jobs.append(Jobs(job: job))
                print("<<<<<Printing Job>>>>>>")
            }
            
            DispatchQueue.main.async {
                self.curJobs = self.jobs
                self.tableView.reloadData()
            }
        })
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        getStudents()
        print("Finished Loading")
        
        view.addVerticalGradientLayer(topColor: secondaryColor, bottomColor: primaryColor)
        // Do any additional setup after loading the view.
        
    }

}

extension MyJobsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return curJobs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("Creating TableCell\n")
        let job = curJobs[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyJobCell") as! MyJobCell
        cell.navigationController = self.navigationController;
        cell.setJob(job: job)
        print("<<<<<Printing Job>>>>>>")
        print("\(job)")
        
        return cell
    }
    
}

class MyJobCell: UITableViewCell{
    
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var name: UILabel!

    var navigationController:UINavigationController! = nil
    
    func setJob(job: Jobs){
        name.text = job.name
        email.text = job.email
        status.text = job.status
    }
    
}
