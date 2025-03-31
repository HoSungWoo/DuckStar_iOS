//
//  RatingView.swift
//  PresentationLayer
//
//  Created by 김호성 on 2025.03.31.
//

import UIKit

class RatingView: UIView {
    
    private let stackView: UIStackView = UIStackView()
    private let starViews: [StarView] = [
        StarView(),
        StarView(),
        StarView(),
        StarView(),
        StarView(),
    ]
    
    private var rating: Int = 0
    
    var star: Float {
        get {
            return Float(rating) / 2.0
        }
        set {
            rating = Int(newValue * 2)
        }
    }
    var accentColor: UIColor = UIColor(resource: .dsmain)
    var baseColor: UIColor = UIColor(resource: .dsgray2)
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        star = 0
        initializeView()
    }
    
    private func initializeView() {
        stackView.axis = .horizontal
        stackView.spacing = 6
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        starViews.forEach({ starView in
            stackView.addArrangedSubview(starView)
        })
    }
}
