//
//  TutorCellDetailViewController.swift
//  AggieTutor
//
//  Created by Zaid Alrakabi on 12/2/18.
//  Copyright © 2018 Aggie Tutor. All rights reserved.
//

import UIKit

class TutorCellDetailViewController: UIViewController {
    
    var name: String!
    var hourlyRate: String!
    var classTeaching: String!
    var qualifications: String!
    

    @IBOutlet weak var setName: UITextField!
    @IBOutlet weak var sethourlyRate: UITextField!
    @IBOutlet weak var setclassTeaching: UITextField!
    @IBOutlet weak var setqualifications: UITextField!
    
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var HRLabel: UILabel!
    @IBOutlet weak var ClassLabel: UILabel!
    @IBOutlet weak var QualificationLabel: UILabel!
    @IBAction func RequestPressed(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer(topColor: secondaryColor, bottomColor: primaryColor)
        setName.text = name
        sethourlyRate.text = hourlyRate
        setclassTeaching.text = classTeaching
        setqualifications.text = qualifications
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
