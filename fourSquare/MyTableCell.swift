//
//  MyTableCell.swift
//  fourSquare
//
//  Created by Ayub Ali on 30/11/2021.
//

import UIKit

class MyTableCell: UITableViewCell {
    
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var placeDistance: UILabel!
    @IBOutlet weak var placeProduct: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
