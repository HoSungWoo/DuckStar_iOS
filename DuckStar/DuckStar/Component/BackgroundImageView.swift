//
//  BackgroundImageView.swift
//  DuckStar
//
//  Created by 김호성 on 2025.02.27.
//

import UIKit

@IBDesignable class BackgroundImageView: UIImageView {
//    override var image: UIImage? {
//        didSet {
//            image = image?.applyBlur(radius: blur)
//        }
//    }
    
    @IBInspectable var blur: CGFloat = 0.0 {
        didSet {
            image = image?.applyBlur(radius: blur)
        }
    }
    
    @IBInspectable var startColor: UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0) {
        didSet {
            gradientLayer.colors?[0] = startColor.cgColor
        }
    }
    @IBInspectable var endColor: UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0) {
        didSet {
            gradientLayer.colors?[1] = endColor.cgColor
        }
    }
    
    @IBInspectable var startPoint: CGPoint = CGPoint(x: 0, y: 0.5) {
        didSet {
            gradientLayer.startPoint = startPoint
        }
    }
    @IBInspectable var endPoint: CGPoint = CGPoint(x: 1, y: 0.5) {
        didSet {
            gradientLayer.endPoint = endPoint
        }
    }
    
    let gradientLayer = CAGradientLayer()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        addGradient()
    }
    
    private func addGradient() {
//        gradientLayer.frame = bounds
        gradientLayer.frame = UIScreen.main.bounds
        gradientLayer.colors = [
            startColor.cgColor,
            endColor.cgColor,
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        layer.addSublayer(gradientLayer)
    }
}
