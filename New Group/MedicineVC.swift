//
//  MedicineVC.swift
//  dawaay
//
//  Created by mohammad.alsharif on 17/04/1443 AH.
//

import UIKit

class MedicineVC: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    var newPat = PatientTable()
    var patient : Patient!
    var cameraMedicineVC = UIImagePickerController()
    
    @IBOutlet weak var medicineImg: UIImageView!
    @IBOutlet weak var medicineTextField: UITextField!
    @IBOutlet weak var quaintity: UITextField!
    
    @IBAction func done(_ sender: Any) {
       
       //  fetchRequest
//         assign the result of fetchRequest to array
       
            if newPat.patient.indices.contains(0) {
                patient = newPat.patient[0]
                print("Patient found \(patient.userName)")

            }}
            
        
//        let patientDetails = storyboard?.instantiateViewController(withIdentifier: "patDetails") as! ResultViewController
//
//        patientDetails.patient = patient
//
//        present(patientDetails, animated: true, completion: nil)
   
    
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

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//                    let detailsVC = segue.destination as! ResultViewController
//                    detailsVC.patient = patient
//
        
}
    

    


