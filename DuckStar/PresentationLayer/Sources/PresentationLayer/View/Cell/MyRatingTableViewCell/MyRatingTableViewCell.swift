//
//  MyRatingTableViewCell.swift
//  PresentationLayer
//
//  Created by 김호성 on 2025.03.31.
//

import UIKit

class MyRatingTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        Task { @MainActor in
            selectionStyle = .none
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
