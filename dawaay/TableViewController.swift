//
//  TableViewController.swift
//  dawaay
//
//  Created by Osama folta on 18/04/1443 AH.
//

import UIKit

class TableViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(patient.count)
        //print(orders[1].drugName)
       
        
        return patient.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = patient[indexPath.row].userName
        cell.detailTextLabel?.text =  String(patient[indexPath.row].phoneNumber)
//        let ords = patient[indexPath.row].requset?.value(forKey: "drugName")
//        print(ords)
       // cell.detailTextLabel?.text = ords! as? String
        
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var patient = [Patient]()
    var orders = [Order]()
    var pharmacies = Pharmacy?.self
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        fetchDataFromDB()
        
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    func fetchDataFromDB() {
        // get the context
        // configure the request - NSFetchRequest
        let request = Patient.fetchRequest()
        do {
            try! patient = context.fetch(request)
           print(patient)
        }
       // let orderRuqset
    }

    // MARK: - Table view data source

//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return patient.count
//    }

       
    

    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = orders[indexPath.row].drugName
//        cell.detailTextLabel?.text =  orders[indexPath.row].orderDate
//
//        return cell
//    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
