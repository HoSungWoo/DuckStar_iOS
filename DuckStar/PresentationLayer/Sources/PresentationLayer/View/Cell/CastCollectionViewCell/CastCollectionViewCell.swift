//
//  CastCollectionViewCell.swift
//  PresentationLayer
//
//  Created by 김호성 on 2025.03.25.
//

import UIKit

class CastCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    
    override func awakeFromNib() {
        Task { @MainActor in
            profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2
        }
    }
}
