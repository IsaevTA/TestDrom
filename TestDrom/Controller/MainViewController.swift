//
//  ViewController.swift
//  TestDrom
//
//  Created by Timur Isaev on 14.02.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    var collectionView: UICollectionView!
    var refreshControl = UIRefreshControl()
    
    let data: [String] = ["https://look.com.ua/pic/202102/800x600/look.com.ua-372749.jpg",
                          "https://look.com.ua/pic/201601/800x600/look.com.ua-146701.jpg",
                          "https://look.com.ua/pic/202012/800x600/look.com.ua-368463.jpg",
                          "https://look.com.ua/pic/202102/800x600/look.com.ua-372849.jpg",
                          "https://look.com.ua/pic/201903/800x600/look.com.ua-334806.jpg",
                          "https://look.com.ua/pic/202102/800x600/look.com.ua-372902.jpg"]
    var visableData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Test app for Drom"
        
        visableData = data
        
        createCollectionView()
    }
    
    private func createCollectionView() {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            self.view.topAnchor.constraint(equalTo: collectionView.topAnchor),
            self.view.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor),
            self.view.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor),
            self.view.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
        ])
        self.collectionView = collectionView
        
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CellCollectionView.self, forCellWithReuseIdentifier: CellCollectionView.identifier)
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = .white
        collectionView.setCollectionViewLayout(CustomFlowLayout(), animated: true)
        
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        collectionView.addSubview(refreshControl)
    }
    
    @objc func refresh(_ sender: AnyObject) {
        refreshControl.endRefreshing()
        visableData = data
        collectionView.reloadData()
    }
}
