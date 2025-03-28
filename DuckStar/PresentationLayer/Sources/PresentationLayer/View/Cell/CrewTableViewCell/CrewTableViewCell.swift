//
//  CrewTableViewCell.swift
//  PresentationLayer
//
//  Created by 김호성 on 2025.03.25.
//

import UIKit

class CrewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var studioLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        Task { @MainActor in
            selectionStyle = .none
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
