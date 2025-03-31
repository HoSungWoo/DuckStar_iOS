//
//  StarView.swift
//  PresentationLayer
//
//  Created by 김호성 on 2025.03.31.
//

import UIKit

class StarView: UIView {
    
    private let starImageView: UIImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        initializeView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        initializeView()
    }
    
    private func initializeView() {
        starImageView.contentMode = .scaleAspectFit
        NSLayoutConstraint.activate([
            starImageView.topAnchor.constraint(equalTo: topAnchor),
            starImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            starImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            starImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            starImageView.widthAnchor.constraint(equalTo: heightAnchor)
        ])
    }
}
