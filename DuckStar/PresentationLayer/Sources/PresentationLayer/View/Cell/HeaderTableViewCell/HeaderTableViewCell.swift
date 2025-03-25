//
//  RatingTableViewCell.swift
//  DuckStar
//
//  Created by 김호성 on 2025.02.27.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var chevronImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        Task { @MainActor in
            selectionStyle = .none
            chevronImageView.tintColor = isHighlighted ? .dsgray4 : .dsgray6
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        chevronImageView.tintColor = highlighted ? .dsgray4 : .dsgray6
    }
    
}
