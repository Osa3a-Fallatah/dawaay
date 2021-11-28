//
//  LoginPatientVC.swift
//  dawaay
//
//  Created by mohammad.alsharif on 20/04/1443 AH.
//

import UIKit
import CoreData

class LoginPatientVC: UIViewController {
    var result = [Patient]()
    var patientTable = PatientTable ()
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
             
        let request = Patient.fetchRequest() as NSFetchRequest<Patient>
        let userName = userNamePatientLogin.text
        let pass = passwordPatientLogin.text
       
        //filter we cam also use btewwn and others
        //filter
             var filter = NSPredicate(format: "userName == %@ AND password ==%@ ", userName!, pass! )
              request.predicate = filter
        
        do {
            self.result = try! self.context.fetch(request)
          }// append it to result array
        if(result.count == 0)
        {
            print ("the user not Found")
            let medicineVC = storyboard?.instantiateViewController(withIdentifier: "LoginPatientID") as! LoginPatientVC
            present(medicineVC, animated: true, completion: nil)

            
        }
        else {
            print ( "welcome")
            print(result.count)
                let medicineVC = storyboard?.instantiateViewController(withIdentifier: "PatientID") as! MedicineVC
                  present(medicineVC, animated: true, completion: nil)
        }
    }
             
}

