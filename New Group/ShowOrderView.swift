//
//  ShowOrderView.swift
//  dawaay
//
//  Created by Osama folta on 20/04/1443 AH.
//

import UIKit
import CoreData
let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

protocol passDataBack{
    func updateRow(staus:Bool)
}
class ShowOrderView: UIViewController {
    var test = OrdersTable()
    var delegate:passDataBack!
    var patientObj = Patient()
    
    @IBOutlet weak var dateLable: UILabel!
    @IBOutlet weak var idLable: UILabel!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var quantityLable: UILabel!
    @IBOutlet weak var locationLable: UILabel!
    @IBOutlet weak var phoneLable: UILabel!
    @IBOutlet weak var statusSwitch: UISwitch!
    @IBAction func confirmButton(_ sender: Any) {
        
        let alert = UIAlertController(title: "Change Status ", message: nil, preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default, handler: { action in
            
            self.patientObj.linkToOrder?.sataus = self.statusSwitch.isOn
            print(self.statusSwitch.isOn)
            try! context.save()
            
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        //
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
        
    }
    
    var orderPicture = "no info"
    var orderStaus = false
    var orderId = 01
    var orderQuantity = 0
    var orderDates = "no info"
    var orderName = "ok im testing here"
    var patientLocation = "no info"
    var patientPhone = 0
    var indxpath = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateLable.text = orderDates
        idLable.text = String(orderId)
        nameLable.text = orderName
        quantityLable.text = String(orderQuantity)
        locationLable.text = String(patientLocation)
        phoneLable.text = String(patientPhone)
        statusSwitch.isOn = orderStaus
        print(indxpath)
        
    }
    
    @IBAction func logout(_ sender: Any) {
        let trancfer = storyboard?.instantiateViewController(withIdentifier: "mainPage") as! ViewController
        present(trancfer, animated: false, completion: nil)
    }
    
    
    
}
