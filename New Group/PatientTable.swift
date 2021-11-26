//
//  PatientTable.swift
//  dawaay
//
//  Created by Osama folta on 20/04/1443 AH.
//

import UIKit
import CoreData


class PatientTable: UIViewController,UITableViewDelegate , UITableViewDataSource, passDataBack {
    var counter = 50
    var onOff=false
    func updateRow(staus: Bool) {
        onOff = staus
        tableViewForPatient.reloadData()
    }
    
    @IBOutlet weak var tableViewForPatient: UITableView!
    
    var patient = [Patient]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {  return patient.count  }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = patient[indexPath.item].linkToOrder?.drugName
        cell.detailTextLabel?.text=String(patient[indexPath.row].linkToOrder!.orderId)
        print(patient.count)
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDataFromDB()
        tableViewForPatient.reloadData()
        tableViewForPatient.delegate = self
        tableViewForPatient.dataSource = self
        
        // addNewP_addNewO_save()
    }
    
    func fetchDataFromDB() {
        let request = Patient.fetchRequest()
        do {try! patient = context.fetch(request)
            DispatchQueue.main.async {
                self.tableViewForPatient.reloadData()
            }
        }}
    
    
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
        detailsVC.indxpath = tableViewForPatient.indexPathForSelectedRow!.row
    }
    
    
    func addNewP_addNewO_save(){
        let newP1 = Patient(context: context)
        
        newP1.userName = "sami alrajhi"
        newP1.password = "abcd123abc"
        newP1.patientLocation =  "1riyadh 43st0"
        newP1.phoneNumber = 0550157334
        
        let order1 = Order(context: context)
        order1.drugName = "covid 19 vacien"
        order1.quantity = 1
        order1.orderId = 13
        order1.orderId = Int64(counter)
        order1.orderDate = "11/12/2021"
        order1.sataus = false
        //show in table using the relationship
        newP1.linkToOrder = order1
        do {try context.save()
            print("saved sucssus")}
        catch {print("Failed saving")}
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? { let actionDelete = UIContextualAction(style: .destructive, title: "Delete") { _, _, handler in
        let itemToDelete = self.patient[indexPath.row]
        self.context.delete(itemToDelete)
       try! self.context.save()
        self.fetchDataFromDB()
    }
    return UISwipeActionsConfiguration(actions: [actionDelete]) }
}


