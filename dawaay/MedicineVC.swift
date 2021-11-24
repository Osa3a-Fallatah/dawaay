//
//  MedicineVC.swift
//  dawaay
//
//  Created by mohammad.alsharif on 17/04/1443 AH.
//

import UIKit

class MedicineVC: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    var cameraMedicineVC = UIImagePickerController()
    
    @IBOutlet weak var medicineImg: UIImageView!
    @IBOutlet weak var medicineTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cameraMedicineVC.delegate = self
    }
    
    @IBAction func onTakePhoto(_ sender: UIButton) {
        let alart = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alart.addAction(UIAlertAction(title: "Camera", style: .default, handler: {[self] _ in
            
            self.cameraMedicineVC.sourceType = .camera
            present(cameraMedicineVC, animated: true, completion: nil)
        }))
        
        alart.addAction(UIAlertAction(title: "Photo Album", style: .default, handler: {[self] _ in
            
            self.cameraMedicineVC.sourceType = .photoLibrary
            present(cameraMedicineVC, animated: true, completion: nil)
            
        }))
        present(alart, animated: true, completion: nil)
        alart.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        cameraMedicineVC.dismiss(animated: true, completion: nil)
        medicineImg.image = (info[.originalImage] as! UIImage)
    }

}
