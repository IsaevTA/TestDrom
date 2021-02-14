//
//  MainViewController+UICollectionViewDelegate.swift
//  TestDrom
//
//  Created by Timur Isaev on 14.02.2021.
//

import UIKit

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        visableData.remove(at: indexPath.row)
        
        self.collectionView.performBatchUpdates({
            self.collectionView.deleteItems(at: [indexPath])
        }, completion: nil)
    }
}
