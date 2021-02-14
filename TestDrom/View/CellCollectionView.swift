//
//  CellCollectionView.swift
//  TestDrom
//
//  Created by Timur Isaev on 14.02.2021.
//

import UIKit

class CellCollectionView: UICollectionViewCell {

    static var identifier: String = "MyCell"

    var imageView: UIImageView!
    let activitiIndicator = UIActivityIndicatorView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        activitiIndicator.center = self.center
        activitiIndicator.startAnimating()
        
        let imageViewInit = UIImageView(frame: .zero)
        imageViewInit.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(imageViewInit)
        
        NSLayoutConstraint.activate([
            self.contentView.topAnchor.constraint(equalTo: imageViewInit.topAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: imageViewInit.bottomAnchor),
            self.contentView.leadingAnchor.constraint(equalTo: imageViewInit.leadingAnchor),
            self.contentView.trailingAnchor.constraint(equalTo: imageViewInit.trailingAnchor),
        ])
        self.imageView = imageViewInit
    }

    func configurationCell(urlImage: String) {
        ImageLoader.shared.obtainImageWithPath(imagePath: urlImage) { (image) in
            self.imageView.image = image
            self.activitiIndicator.stopAnimating()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
