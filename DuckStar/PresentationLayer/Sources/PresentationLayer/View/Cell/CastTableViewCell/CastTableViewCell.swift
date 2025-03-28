//
//  CastTableViewCell.swift
//  PresentationLayer
//
//  Created by 김호성 on 2025.03.25.
//

import UIKit

class CastTableViewCell: UITableViewCell {

    @IBOutlet weak var castCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
