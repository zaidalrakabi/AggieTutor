//
//  RequestViewController.swift
//  AggieTutor
//
//  Created by Zaid Alrakabi on 12/6/18.
//  Copyright © 2018 Aggie Tutor. All rights reserved.
//

import UIKit
import Firebase

class RequestViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var databaseRefer: DatabaseReference!
    var databaseHandle: DatabaseHandle!
    
    var request = [Request]()
    var curReq = [Request]()
    
    func getRequest(){
        databaseRefer = Database.database().reference()
        
        let uID = Auth.auth().currentUser!.uid
        let query = self.databaseRefer.child("users/\(uID)/requests")
        
        query.observe(.value, with: { (snapshot) in
            //print(snapshot.value ?? "nothing")
            
            if(!self.request.isEmpty){
                self.request.removeAll()
            }
            
            
            for child in snapshot.children{
                let request = child as! DataSnapshot
                self.request.append(Request(request: request))
                print("<<<<<Printing Request>>>>>>")
            }
            
            DispatchQueue.main.async {
                self.curReq = self.request
                self.tableView.reloadData()
            }
        })
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        getRequest()
        print("done loading")
        
        view.addVerticalGradientLayer(topColor: secondaryColor, bottomColor: primaryColor)
        // Do any additional setup after loading the view.
    }

}


extension RequestViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return curReq.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("Creating TableCell\n")
        let request = curReq[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "RequestCell") as! RequestCell
        cell.navigationController = self.navigationController;
        cell.setReq(request: request)
        print("<<<<<Printing Request>>>>>>")
        print("\(request)")
        
        return cell
    }
    
}

class RequestCell: UITableViewCell{
    
    @IBOutlet weak var rate: UILabel!
    @IBOutlet weak var course: UILabel!
    
    var navigationController:UINavigationController! = nil
    
    func setReq(request: Request){
        rate.text = "$" + String(request.rate)
        course.text = request.course
    }
}
