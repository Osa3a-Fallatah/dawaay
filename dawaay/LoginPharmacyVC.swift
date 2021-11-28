//
//  LoginPharmacyVC.swift
//  dawaay
//
//  Created by mohammad.alsharif on 20/04/1443 AH.
//

import UIKit

class LoginPharmacyVC: UIViewController {

    var defults = UserDefaults.standard
    @IBOutlet weak var userNamePharmacyLogin: UITextField!
    @IBOutlet weak var passwordPharmacyLogin: UITextField!
    override func viewDidLoad() {
      super.viewDidLoad()
    }
    @IBAction func pharmacyLogin(_ sender: UIButton) {
      if (userNamePharmacyLogin.text == "Admin") && (passwordPharmacyLogin.text == "12345") { print("ok")
          performSegue(withIdentifier: "PatientTable", sender: self)
      } else {
          let titel = "Wrong Action"
          let msg = "Enter Username and password correctly"
          let alter = UIAlertController(title: titel, message: msg, preferredStyle: .alert)
          alter.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
          present(alter, animated: true, completion: nil)
        
      }
    }


}
