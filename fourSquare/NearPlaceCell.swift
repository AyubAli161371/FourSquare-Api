//
//  NearPlaceCell.swift
//  fourSquare
//
//  Created by Ayub Ali on 07/12/2021.
//

import UIKit

class NearPlaceCell: UITableViewCell {
    
    
   
    @IBOutlet weak var nearImage: UIImageView!
    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var product: UILabel!
    @IBOutlet weak var distance: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
