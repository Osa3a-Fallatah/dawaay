//
//  CollectionCell.swift
//  dawaay
//
//  Created by Osama folta on 22/04/1443 AH.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var drugID: UILabel!
    @IBOutlet weak var drugName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
