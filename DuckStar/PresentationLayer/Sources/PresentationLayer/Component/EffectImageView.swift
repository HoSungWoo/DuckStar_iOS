//
//  EffectImageView.swift
//  EffectImageView
//
//  Created by 김호성 on 2025.02.27.
//

import UIKit

class EffectImageView: UIView {
    
    let mainImageView: UIImageView = UIImageView()
    let gradientView: GradientView = GradientView()
    let blurView: UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    
    @IBInspectable public var image: UIImage? {
        didSet {
            mainImageView.image = image?.withBlur(radius: 0)
        }
    }
    
    @IBInspectable public var colors: [UIColor] = [] {
        didSet {
            gradientView.colors = colors
        }
    }
    
    public var locations: [NSNumber] = [] {
        didSet {
            gradientView.locations = locations
        }
    }
    
    public var scale: CGFloat = 1.0 {
        didSet {
//            mainImageView.transform = .identity
            mainImageView.transform = CGAffineTransform(scaleX: scale, y: scale)
        }
    }
    
    @IBInspectable public var startPoint: CGPoint = CGPoint(x: 0, y: 0.5) {
        didSet {
            gradientView.startPoint = startPoint
        }
    }
    @IBInspectable public var endPoint: CGPoint = CGPoint(x: 1, y: 0.5) {
        didSet {
            gradientView.endPoint = endPoint
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        initializeImageView()
    }
    
    public override func didAddSubview(_ subview: UIView) {
        super.didAddSubview(subview)
//        sendSubviewToBack(blurView)
        sendSubviewToBack(gradientView)
        sendSubviewToBack(mainImageView)
    }
    
    private func initializeImageView() {
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        blurView.translatesAutoresizingMaskIntoConstraints = false
        mainImageView.contentMode = contentMode
        mainImageView.clipsToBounds = true
        
//        addSubview(blurView)
        addSubview(gradientView)
        addSubview(mainImageView)
        
        
        NSLayoutConstraint.activate([
            mainImageView.topAnchor.constraint(equalTo: topAnchor),
            mainImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            gradientView.topAnchor.constraint(equalTo: topAnchor),
            gradientView.bottomAnchor.constraint(equalTo: bottomAnchor),
            gradientView.leadingAnchor.constraint(equalTo: leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
//            blurView.topAnchor.constraint(equalTo: topAnchor),
//            blurView.bottomAnchor.constraint(equalTo: bottomAnchor),
//            blurView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            blurView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        
    }
    
    
}

extension EffectImageView: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return mainImageView
    }
}
