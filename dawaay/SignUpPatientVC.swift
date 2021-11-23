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
//        if userNamePatient.text?.count == 0 {
//            print("empty")
//        } else if phoneNumberPatient.text?.count ?? 0 < 0 {
//            print("Hi")
//        } else {
        
        let medicineVC = (storyboard?.instantiateViewController(withIdentifier: "PatientID"))!
        navigationController?.show(medicineVC, sender: self)
//        navigationController?.showDetailViewController(medicineVC, sender: self)
        }
    }
    
//}
