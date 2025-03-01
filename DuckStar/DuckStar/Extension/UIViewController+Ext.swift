//
//  UIViewController+Ext.swift
//  DuckStar
//
//  Created by Hosung.Kim on 2021/11/22.
//

import UIKit

enum ViewControllerEnum: String, CaseIterable {
    case anime
}

extension UIViewController {

    // MARK: - Public Method
    class func getViewController(viewControllerEnum: ViewControllerEnum) -> UIViewController {
        switch viewControllerEnum {
        case .anime:
            return getViewController(storyboard: "Anime", identifier: String(describing: AnimeViewController.self), modalPresentationStyle: .fullScreen)
        }
    }
    
    // MARK: - Private Method
    private class func getViewController(storyboard: String, identifier: String, modalPresentationStyle: UIModalPresentationStyle) -> UIViewController {
        let sb = UIStoryboard(name: storyboard, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: identifier)
        vc.modalPresentationStyle = modalPresentationStyle
        return vc
    }
}
