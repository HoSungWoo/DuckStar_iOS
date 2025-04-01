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
    
    var star: Float = 0 {
        didSet {
            starDidSet()
        }
    }
    private func starDidSet() {
        starViews.enumerated().forEach({ index, starView in
            starView.fill = max(0, min(star-Float(index), 1))
        })
    }
    
    var accentColor: UIColor = UIColor(resource: .dsmain) {
        didSet {
            accentColorDidSet()
        }
    }
    private func accentColorDidSet() {
        starViews.forEach({ starView in
            starView.accentColor = accentColor
        })
    }
    
    var baseColor: UIColor = UIColor(resource: .dsgray2) {
        didSet {
            baseColorDidSet()
        }
    }
    private func baseColorDidSet() {
        starViews.forEach({ starView in
            starView.baseColor = baseColor
        })
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        initializeView()
    }
    
    private func initializeView() {
        starDidSet()
        accentColorDidSet()
        baseColorDidSet()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panGestureHandler(recognizer: )))
        addGestureRecognizer(panGestureRecognizer)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapGestureHandler(recognizer: )))
        addGestureRecognizer(tapGestureRecognizer)
        
        stackView.axis = .horizontal
        stackView.spacing = 6
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        starViews.forEach({ starView in
            stackView.addArrangedSubview(starView)
        })
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    // MARK: - PanGesture
    @objc private func panGestureHandler(recognizer: UIPanGestureRecognizer) {
        // 0.5 단위로
        let newStar = max(0, min(Float(Int(recognizer.location(in: self).x / self.bounds.width * 10)+1) / 2.0, 5))
        // 부드럽게
//        let newStar = max(0, min(Float(recognizer.location(in: self).x / self.bounds.width * 5), 5))
        if newStar != star {
            HapticManager.shared.generate()
        }
        star = newStar
    }
    
    // MARK: - TapGesture
    @objc private func tapGestureHandler(recognizer: UITapGestureRecognizer) {
        // 0.5 단위로
        let newStar = max(0, min(Float(Int(recognizer.location(in: self).x / self.bounds.width * 10)+1) / 2.0, 5))
        // 부드럽게
//        let newStar = max(0, min(Float(recognizer.location(in: self).x / self.bounds.width * 5), 5))
        if newStar != star {
            HapticManager.shared.generate()
        }
        star = newStar
    }
}
