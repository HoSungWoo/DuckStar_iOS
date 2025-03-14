//
//  UIImage+Ext.swift
//  DuckStar
//
//  Created by 김호성 on 2025.02.27.
//

import Foundation
import UIKit

extension UIImage {
    func withBlur(radius: CGFloat) -> UIImage {
        let context = CIContext()
        guard let ciImage = CIImage(image: self),
              let clampFilter = CIFilter(name: "CIAffineClamp"),
              let blurFilter = CIFilter(name: "CIGaussianBlur") else {
            return self
        }
        clampFilter.setValue(ciImage, forKey: kCIInputImageKey)
        blurFilter.setValue(clampFilter.outputImage, forKey: kCIInputImageKey)
        blurFilter.setValue(radius, forKey: kCIInputRadiusKey)
        guard let output = blurFilter.outputImage,
              let cgImage = context.createCGImage(output, from: ciImage.extent) else {
            return self
        }
        return UIImage(cgImage: cgImage)
    }
    
    func withGradient(startColor: UIColor, endColor: UIColor, startPoint: CGPoint, endPoint: CGPoint) -> UIImage {
        let size = CGSize(width: self.size.width, height: self.size.height)
        
        let renderer = UIGraphicsImageRenderer(size: size)
        
        return renderer.image { context in
            let layer = CALayer()
            layer.contents = self.cgImage
            layer.frame = CGRect(origin: .zero, size: size)
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = CGRect(origin: .zero, size: size)
            gradientLayer.colors = [
                startColor.cgColor,
                endColor.cgColor,
            ]
            gradientLayer.startPoint = startPoint
            gradientLayer.endPoint = endPoint
            layer.addSublayer(gradientLayer)
            layer.render(in: context.cgContext)
        }
    }
}
