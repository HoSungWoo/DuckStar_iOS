//
//  File.swift
//  PresentationLayer
//
//  Created by 김호성 on 2025.03.24.
//

import Foundation
import UIKit

extension UIView {
    func setShadow(
        path: CGPath? = nil,
        color: UIColor = .dsblack,
        radius: CGFloat = 0,
        opacity: Float = 1,
        offset: CGSize = .zero
    ) {
        layer.shadowPath = path ?? UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
    }
}
