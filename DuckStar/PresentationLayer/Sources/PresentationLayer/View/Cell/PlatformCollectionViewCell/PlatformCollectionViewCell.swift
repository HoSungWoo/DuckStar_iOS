//
//  PlatformCollectionViewCell.swift
//  PresentationLayer
//
//  Created by 김호성 on 2025.03.14.
//

import UIKit

class PlatformCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mainImageView: UIImageView!
    
    override func awakeFromNib() {
        Task { @MainActor in
            mainView.setShadow(
                path: UIBezierPath(roundedRect: mainImageView.bounds, cornerRadius: mainImageView.layer.cornerRadius).cgPath,
                radius: 4
            )
        }
    }
}
