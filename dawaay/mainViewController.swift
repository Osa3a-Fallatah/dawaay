//  ViewController.swift
//  dawaay
//
//  Created by Osama folta on 16/04/1443 AH.

import UIKit

class ViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var patient = [Patient]()
    var orders = [Order]()
    var pharmacies = Pharmacy?.self
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        fetchDataFromDB()
    }
    
    func fetchDataFromDB() {
        // get the context
        // configure the request - NSFetchRequest
        let request = Patient.fetchRequest()
        do {
            try! patient = context.fetch(request)
           // print(patient)
        }
}

    
    @IBAction func onPressPatient(_ sender: UIButton) {
        let newP1 = Patient(context: context)
        
        newP1.userName = "SALIME MOAHMED"
        newP1.password = "123"
        newP1.patientLocation =  1928374290
        newP1.phoneNumber = 0556006662
        
        let order1 = Order(context: context)
        order1.drugName = "Java scRipt 23"
        order1.quantity = 2
        order1.orderId = 87
        order1.orderDate = "1/12/2021"
        order1.sataus = false
        
        let order2 = Order(context: context)
        order2.drugName = "OklaHoma ProTeen"
        order2.quantity = 6
        order2.orderId = 87
        order2.orderDate = "1/12/2021"
        order2.sataus = false
 
        newP1.addToRequset(order1)
        newP1.addToRequset(order2)
        
        let pharmacy = Pharmacy(context:context)
        pharmacy.nameOfPharmacy = "Alnahdi"
        order1.linkToPharmacy = pharmacy
        pharmacy.linkToOrder?.sataus = true
        
        do {
           try context.save()
          } catch {
              print("Failed saving")
        }
        
      print(newP1.userName)
        print(newP1.requset)
        fetchDataFromDB()
        print(patient.count)
        //try! context.save()
    }
    
}
