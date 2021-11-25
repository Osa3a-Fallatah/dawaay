//
//  ViewController.swift
//  dawaay
//
//  Created by Osama folta on 16/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var patientImg: UIImageView!
    @IBOutlet weak var pharmacyImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        patientImg.isUserInteractionEnabled = true
        pharmacyImg.isUserInteractionEnabled = true
        
        let Patient = UIGestureRecognizer(target: self, action: #selector(tapGesturePatien))
        let Pharmacy = UIGestureRecognizer(target: self, action: #selector(tapGesturePhrmacy))
    }
    
    @IBAction func tapGesturePatien(_ sender: UITapGestureRecognizer) {
        let patientVC = storyboard?.instantiateViewController(withIdentifier: "LoginPatientID") as! LoginPatientVC
        present(patientVC, animated: true, completion: nil)
    }
    
    
    @IBAction func tapGesturePhrmacy(_ sender: UITapGestureRecognizer) {
        let pharmacyVC = storyboard?.instantiateViewController(withIdentifier: "LoginPharmacyID") as! LoginPharmacyVC
        present(pharmacyVC, animated: true, completion: nil)
    }
}

