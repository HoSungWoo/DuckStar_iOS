//
//  ViewControllerFactory.swift
//  PresentationLayer
//
//  Created by 김호성 on 2025.03.04.
//

import Foundation
import UIKit

public protocol ViewControllerFactory {
    func createAnimeViewController() -> AnimeViewController
    func createCreditViewController() -> CreditViewController
    func createCastCrewViewController() -> CastCrewViewController
}
