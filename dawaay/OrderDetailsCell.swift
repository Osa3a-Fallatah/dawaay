//
//  OrderDetailsCell.swift
//  dawaay
//
//  Created by Yazan Alraddadi on 16/04/1443 AH.
//

import UIKit

class OrderDetailsCell: UITableViewCell {


    
    @IBOutlet weak var OrderName: UILabel!
    
    @IBOutlet weak var OrderDescription: UILabel!
  
    @IBOutlet weak var Date: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
