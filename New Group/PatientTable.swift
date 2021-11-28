//
//  PatientTable.swift
//  dawaay
//
//  Created by Osama folta on 20/04/1443 AH.
//

import UIKit
import CoreData


class PatientTable: UIViewController,UITableViewDelegate , UITableViewDataSource, passDataBack {
    var onOff=false
    func updateRow(staus: Bool) {
        onOff = staus
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var patient = [Patient]()
    var color = UIColor(red: 0, green:0.9, blue: 0, alpha: 0.1)
    
    @IBOutlet weak var tableViewForPatient: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {  return patient.count  }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = patient[indexPath.item].linkToOrder?.drugName
        cell.detailTextLabel?.text = patient[indexPath.row].linkToOrder?.orderDate
        //cell.detailTextLabel?.text=String(patient[indexPath.row].linkToOrder!.orderId)
        cell.backgroundColor = color
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewForPatient.delegate = self
        tableViewForPatient.dataSource = self
       
       // addNewP_addNewO_save()
        fetchDataFromDB()
    }
    
    func fetchDataFromDB() {
       let request = Patient.fetchRequest()
         //let filterByA = NSPredicate(format: "userName contains 'osama'")
        //   request.predicate = filterByA
        do {
            try! patient = context.fetch(request)
            DispatchQueue.main.async {
            }
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("User selected: \(indexPath.row)")
        
        performSegue(withIdentifier: "OrderDetail", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let path = tableViewForPatient.indexPathForSelectedRow
        let detailsVC = segue.destination as! ShowOrderView
        detailsVC.orderName = (patient[path!.row].linkToOrder?.drugName)!
        detailsVC.orderId = Int((patient[path!.row].linkToOrder?.orderId)!)
        detailsVC.orderStaus = (patient[path!.row].linkToOrder?.sataus)!
        detailsVC.orderDates = (patient[path!.row].linkToOrder?.orderDate)!
        detailsVC.orderQuantity = Int((patient[path!.row].linkToOrder?.quantity)!)
        detailsVC.patientPhone = Int((patient[path!.row].phoneNumber))
        detailsVC.patientLocation = (patient[path!.row].patientLocation!)
        detailsVC.patientObj = patient[path!.row]
        
        detailsVC.indxpath = tableViewForPatient.indexPathForSelectedRow!.row
    }
    override func viewWillAppear(_ animated: Bool) {
        fetchDataFromDB()
    }
    
    

    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? { let actionDelete = UIContextualAction(style: .destructive, title: "Delete") { _, _, handler in
        let itemToDelete = self.patient[indexPath.row]
        self.context.delete(itemToDelete)
        try! self.context.save()
        self.fetchDataFromDB()
        self.tableViewForPatient.reloadData()
    }
        return UISwipeActionsConfiguration(actions: [actionDelete]) }
    
    
    
    
    
    
    
    
    func addNewP_addNewO_save(){
           let newP1 = Patient(context: context)
           
           newP1.userName = "osama"
           newP1.password = "osama123"
           newP1.patientLocation =  "madina 4st0"
           newP1.phoneNumber = 0550157334
           
           let order1 = Order(context: context)
           order1.drugName = "aaaaa"
           order1.quantity = 2
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


