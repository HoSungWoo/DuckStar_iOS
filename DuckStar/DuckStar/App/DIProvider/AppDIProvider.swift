//
//  AppDIProvider.swift
//  CleanArchitectureMVVM
//
//  Created by 김호성 on 2025.03.04.
//

import PresentationLayer

import Foundation
import UIKit

class AppDIProvider: ViewControllerFactory {
    
    init() {
        self.animeDIProvider = DefaultAnimeDIProvider()
    }
    
    init(animeDIProvider: AnimeDIProvider) {
        self.animeDIProvider = animeDIProvider
    }
    
    private let animeDIProvider: AnimeDIProvider
    
    func createAnimeViewController() -> AnimeViewController {
        let viewController: AnimeViewController = AnimeViewController.create()
        return viewController
    }
}
