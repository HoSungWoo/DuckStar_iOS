//
//  CollectionViewDelegate.swift
//  PresentationLayer
//
//  Created by 김호성 on 2025.03.28.
//

import Foundation
import UIKit

class CollectionViewDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    init(didSelectItemAt: ( (_: UICollectionView, _: IndexPath) -> Void)? = nil, sizeForItemAt: ((_: UICollectionView, _: UICollectionViewLayout, _: IndexPath) -> CGSize)? = nil) {
        self.didSelectItemAt = didSelectItemAt
        self.sizeForItemAt = sizeForItemAt
    }
    
    var didSelectItemAt: ((_ collectionView: UICollectionView, _ indexPath: IndexPath) -> Void)?
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectItemAt?(collectionView, indexPath)
    }
    
    var sizeForItemAt: ((_ collectionView: UICollectionView, _ collectionViewLayout: UICollectionViewLayout, _ indexPath: IndexPath) -> CGSize)?
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        sizeForItemAt?(collectionView, collectionViewLayout, indexPath) ?? .zero
    }
}
