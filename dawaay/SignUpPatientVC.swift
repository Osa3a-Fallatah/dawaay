//
//  SignUpPatientVC.swift
//  dawaay
//
//  Created by mohammad.alsharif on 17/04/1443 AH.
//

import UIKit

class SignUpPatientVC: UIViewController {

    @IBOutlet weak var userNamePatient: UITextField!
    @IBOutlet weak var phoneNumberPatient: UITextField!
    @IBOutlet weak var passwordPatient: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func signUpPatient(_ sender: UIButton) {
        if (userNamePatient.text?.count != 0) && (phoneNumberPatient.text?.count != 0) && (passwordPatient.text?.count != 0) {
            let medicineVC = storyboard?.instantiateViewController(withIdentifier: "PatientID") as! MedicineVC
            present(medicineVC, animated: true, completion: nil)
        } else {
            print("not allowed")
        }
    }
}
