//
//  PatientViewController.swift
//  dawaay
//
//  Created by Osama folta on 23/04/1443 AH.
//

import UIKit

class PatientViewController: UIViewController {
    var patient: Patient!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Patient: \(patient)")

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        print("Patient: \(patient)")
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
