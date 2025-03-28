//
//  CollectionViewDataSource.swift
//  PresentationLayer
//
//  Created by 김호성 on 2025.03.28.
//

import Foundation
import UIKit

class CollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    init(numberOfItemsInSection: ( (_: UICollectionView, _: Int) -> Int)? = nil, cellForItemAt: ( (_: UICollectionView, _: IndexPath) -> UICollectionViewCell)? = nil) {
        self.numberOfItemsInSection = numberOfItemsInSection
        self.cellForItemAt = cellForItemAt
    }
    
    var numberOfItemsInSection: ((_ collectionView: UICollectionView, _ section: Int) -> Int)?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfItemsInSection?(collectionView, section) ?? 0
    }
    
    var cellForItemAt: ((_ collectionView: UICollectionView, _ cellForItemAt: IndexPath) -> UICollectionViewCell)?
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return cellForItemAt?(collectionView, indexPath) ?? UICollectionViewCell()
    }
}
