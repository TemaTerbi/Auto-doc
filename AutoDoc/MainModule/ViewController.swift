//
//  ViewController.swift
//  AutoDoc
//
//  Created by Артем Соловьев on 25.06.2024.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        self.navigationItem.title = "Автоновости"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        setupCollectionView()
    }
    
    //MARK: - Cоздание compositional layout для колекции
    private func createLayout() -> UICollectionViewLayout {
        let spacing: CGFloat = 10
        let heightForCell: CGFloat = 400
        let heightForGroup: CGFloat = 410
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(heightForCell))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(heightForGroup))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    //MARK: - Конфигурируем коллекцию и показываем ее на экране
    private func setupCollectionView() {
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.accessibilityIdentifier = "collectionView"
        collectionView.backgroundColor = .systemGray6
        
        view.addSubview(collectionView)
        
        collectionView.activateAnchor()
        collectionView.pinToTopSafeArea(equalTo: view)
        collectionView.pinToBottomSafeArea(equalTo: view)
        collectionView.pinToLeftSafeArea(equalTo: view)
        collectionView.pinToRightSafeArea(equalTo: view)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(PostCollectionViewCell.self, forCellWithReuseIdentifier: "PostCell")
    }
}

