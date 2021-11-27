//
//  LoginPatientVC.swift
//  dawaay
//
//  Created by mohammad.alsharif on 20/04/1443 AH.
//

import UIKit

class LoginPatientVC: UIViewController {
    var result = [Patient]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @IBOutlet weak var userNamePatientLogin: UITextField!
    @IBOutlet weak var passwordPatientLogin: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func patientLogin(_ sender: UIButton) {
        
//        if (userNamePatientLogin.text?.count != 0) && (passwordPatientLogin.text?.count != 0) {
//            let medicineVC = storyboard?.instantiateViewController(withIdentifier: "PatientID") as! MedicineVC
//            present(medicineVC, animated: true, completion: nil)
//        }
//        else {
//            print("not allowed")
//        }
        let request = Patient.fetchRequest()
        var userName = userNamePatientLogin.text
        var pass = passwordPatientLogin.text
        
        var filter = NSPredicate(format :
                                    "userNameCONTAINS '\(userName!) ' AND password CONTAINS '\(pass!)'")
        request.predicate = filter
        
        do {
            try! result = context.fetch(request)
            
        }// append it to result array
        if(result.count == 0) {
            print ("the user not Found")
            
        }
        else {
            print ( "welcome")
            print(result.count)
            //go to proudect page}
            
        }
    }
}

