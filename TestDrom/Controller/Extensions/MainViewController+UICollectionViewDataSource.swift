//
//  MainViewController+UICollectionViewDataSource.swift
//  TestDrom
//
//  Created by Timur Isaev on 14.02.2021.
//

import UIKit

extension MainViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.visableData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellCollectionView.identifier, for: indexPath) as! CellCollectionView
        let url = self.visableData[indexPath.item]
        cell.configurationCell(urlImage: url)
        return cell
    }
}
