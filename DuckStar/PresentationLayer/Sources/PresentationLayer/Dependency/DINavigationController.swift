//
//  DINavigationController.swift
//  PresentationLayer
//
//  Created by 김호성 on 2025.03.07.
//

import Foundation
import UIKit

public class DINavigationController: UINavigationController {
    
    public var viewControllerFactory: ViewControllerFactory
    
    public init(viewControllerFactory: ViewControllerFactory, rootViewController: UIViewController) {
        self.viewControllerFactory = viewControllerFactory
        super.init(rootViewController: rootViewController)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
