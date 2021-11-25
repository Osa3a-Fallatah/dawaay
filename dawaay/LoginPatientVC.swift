//
//  LoginPatientVC.swift
//  dawaay
//
//  Created by mohammad.alsharif on 20/04/1443 AH.
//

import UIKit

class LoginPatientVC: UIViewController {
    
    @IBOutlet weak var userNamePatientLogin: UITextField!
    @IBOutlet weak var passwordPatientLogin: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func patientLogin(_ sender: UIButton) {
        if (userNamePatientLogin.text?.count != 0) && (passwordPatientLogin.text?.count != 0) {
            let medicineVC = storyboard?.instantiateViewController(withIdentifier: "PatientID") as! MedicineVC
            present(medicineVC, animated: true, completion: nil)
        } else {
            print("not allowed")
        }
    }
    
    
}
