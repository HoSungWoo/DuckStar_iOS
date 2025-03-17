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
    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        mainView.layer.shadowPath = UIBezierPath(roundedRect: mainImageView.bounds, cornerRadius: mainImageView.layer.cornerRadius).cgPath
//        mainView.layer.shadowColor = UIColor.black.cgColor
//        mainView.layer.shadowRadius = 4
//        mainView.layer.shadowOpacity = 1
//        mainView.layer.shadowOffset = .zero
//    }
    
    override func awakeFromNib() {
        Task { @MainActor in
            mainView.layer.masksToBounds = false
            mainView.layer.shadowPath = UIBezierPath(roundedRect: mainImageView.bounds, cornerRadius: mainImageView.layer.cornerRadius).cgPath
            mainView.layer.shadowColor = UIColor.black.cgColor
            mainView.layer.shadowRadius = 4
            mainView.layer.shadowOpacity = 1
            mainView.layer.shadowOffset = .zero
        }
    }
}
