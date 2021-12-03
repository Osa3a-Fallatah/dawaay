//
//  MedicineVC.swift
//  dawaay
//
//  Created by mohammad.alsharif on 17/04/1443 AH.
//

import UIKit

class PatientRequests: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var newPat = OrdersTable()
    var patient : Patient!
    var cameraMedicineVC = UIImagePickerController()
    
    @IBOutlet weak var medicineImg: UIImageView!
    @IBOutlet weak var medicineTextField: UITextField!
    @IBOutlet weak var quaintity: UITextField!
    
    @IBAction func done(_ sender: Any) {
        if (medicineTextField.text != "") && quaintity.text != "" {
            addNewP_addNewO_save()
        }
        if newPat.patient.indices.contains(0) {
            patient = newPat.patient[0]
            print("Patient found \(patient.userName)")
            
        }}
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
        addNewP_addNewO_save()
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        cameraMedicineVC.dismiss(animated: true, completion: nil)
        medicineImg.image = (info[.originalImage] as! UIImage)
    }
    func addNewP_addNewO_save(){
        let newP1 = Patient(context: context)

        newP1.userName = "osama"
        newP1.password = "osama123"
        newP1.patientLocation =  "madina 4st0"
        newP1.phoneNumber = 0550157334
        
        let order1 = Order(context: context)
        order1.drugName = medicineTextField.text
        order1.quantity = Int64(quaintity.text!) ?? 0
        order1.orderId  = Int64(arc4random_uniform(55)) * Int64(arc4random())
        order1.orderDate = "11/12/2021"
        order1.sataus = false
        order1.linkToPatient = newP1
        
        //show in table using the relationship
        
        do {try context.save()
            print("saved sucssus")}
        catch {print("Failed saving")}
    }
}
