//
//  ViewController.swift
//  AutoDoc
//
//  Created by Артем Соловьев on 25.06.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: UICollectionViewFlowLayout())
    private let flowLayout = UICollectionViewFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.navigationItem.title = "Автоновости"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        addSubviews()
        setupConstraints()
        setupCollectionView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateCollectionView()
    }
    
    private func addSubviews() {
        view.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        collectionView.pinToTopSafeArea(equalTo: view)
        collectionView.pinToBottomSafeArea(equalTo: view)
        collectionView.pinToLeftSafeArea(equalTo: view)
        collectionView.pinToRightSafeArea(equalTo: view)
        collectionView.activateAnchor()
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.register(PostCollectionViewCell.self, forCellWithReuseIdentifier: "PostCell")
        collectionView.setCollectionViewLayout(flowLayout, animated: true)
    }
    
    private func updateCollectionView() {
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        flowLayout.itemSize = CGSize(width: collectionView.frame.size.width - 20, height: 400)
    }
}

