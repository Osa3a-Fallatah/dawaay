//
//  SignUpPatientVC.swift
//  dawaay
//
//  Created by mohammad.alsharif on 17/04/1443 AH.
//

import UIKit

class SignUpPatientVC: UIViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var userNamePatient: UITextField!
    @IBOutlet weak var phoneNumberPatient: UITextField!
    @IBOutlet weak var passwordPatient: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func signUpPatient(_ sender: UIButton) {
//        if (userNamePatient.text?.count != 0) && (phoneNumberPatient.text?.count != 0) && (passwordPatient.text?.count != 0) {
//            let patientLoginVC = storyboard?.instantiateViewController(withIdentifier: "LoginPatientID") as! LoginPatientVC
//            present(patientLoginVC, animated: true, completion: nil)
//        }
//        else {
//            print("not allowed")
//
            
            let newPatient = Patient (context: context)
            newPatient.userName = userNamePatient.text
            newPatient.password = passwordPatient.text
//            newPatient.phoneNumber = phoneNumberPatient.text
          
            // save Context
            do
            {
            try! context.save()
            print ("saved !")
            }
            }
        }
    

