//
//  ResultViewController.swift
//  dawaay
//
//  Created by Osama folta on 22/04/1443 AH.
//

import UIKit

class ResultViewController: UIViewController , UICollectionViewDelegate ,UICollectionViewDataSource{
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
   // var result = [Order]()
    var userinfo = PatientTable()
    var patient : Patient!

    override func viewWillAppear(_ animated: Bool) {
        print("Inject patient: \(patient)")
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    print(userinfo.patient.count)
        return userinfo.patient.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
        cell.drugName.text = userinfo.patient[indexPath.row].linkToOrder?.drugName
        
        //MARK: knowing issus convert bool to string
        cell.status.text = userinfo.patient[indexPath.row].linkToOrder!.sataus ? "Accept" : "Reject"
        cell.drugID.text = (userinfo.patient[indexPath.row].linkToOrder?.orderDate)
        print(String(userinfo.patient[indexPath.row].linkToOrder!.sataus))
        return cell
    }
    

    @IBOutlet weak var collectionView: UICollectionView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate=self
        collectionView.dataSource=self
        collectionView.register(UINib(nibName: "CollectionCell", bundle: nil), forCellWithReuseIdentifier: "CollectionCell")
        fetchDataFromDB2()
    }
    func fetchDataFromDB2() {
        let request = Patient.fetchRequest()
         
        do {
            try! userinfo.patient = context.fetch(request)
            DispatchQueue.main.async {
               // self.tableViewForPatient.reloadData()
            }
        }
        
    }
}
