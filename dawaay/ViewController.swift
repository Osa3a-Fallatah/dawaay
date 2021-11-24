//
//  ViewController.swift
//  dawaay
//
//  Created by Osama folta on 16/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pharmacyImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pharmacyImg.isUserInteractionEnabled = true
        
        let pharmacy = UIGestureRecognizer(target: self, action: #selector(tapGesturePhrmacy(_:)))
    }
    
    @IBAction func tapGesturePhrmacy(_ sender: UITapGestureRecognizer) {
        print("Pharmacy")
        let pharmacyVC = storyboard?.instantiateViewController(withIdentifier: "sigenUpPharmacyID") as! SignUpPharmacyVC
        present(pharmacyVC, animated: true, completion: nil)
        
    }
    

}

