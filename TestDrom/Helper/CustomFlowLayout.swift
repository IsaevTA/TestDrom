//
//  KDCollectionViewFlowLayout.swift
//  TestDrom
//
//  Created by Timur Isaev on 14.02.2021.
//

import UIKit

class CustomFlowLayout: UICollectionViewFlowLayout {
    
    override func finalLayoutAttributesForDisappearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard let attributes = super.finalLayoutAttributesForDisappearingItem(at: itemIndexPath ) else { return nil }
        
        attributes.alpha = 0.0
        attributes.transform = CGAffineTransform(translationX: 1000, y: 0)
        
        return attributes
    }
}
