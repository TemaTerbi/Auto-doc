//
//  ViewController.swift
//  AutoDoc
//
//  Created by Артем Соловьев on 25.06.2024.
//

import UIKit
import Combine

final class ViewController: UIViewController {
    
    private var collectionView: UICollectionView!
    private let viewModel = MainViewModel()
    
    //MARK: - Variables
    private let spacing: CGFloat = 10
    private let heightForCell: CGFloat = 400
    private let heightForGroup: CGFloat = 410
    private var store: Set<AnyCancellable> = []
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        self.navigationItem.title = "Автоновости"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        setupCollectionView()
        
        Task {
            await viewModel.getNews()
        }
        
        viewModel.$news.sink { _ in
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }.store(in: &store)
    }
    
    //MARK: - Cоздание compositional layout для колекции
    private func createLayout() -> UICollectionViewLayout {
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
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
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

//MARK: - Extension for delegate UICollectionView
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    private func pushWithAnimationCelll(nextViewcontroller controller: UIViewController, currentCell cell: UICollectionViewCell) {
        UIView.animate(withDuration: 0.2) {
            cell.transform = CGAffineTransform(scaleX: 2, y: 2)
        }
        navigationController?.pushViewController(controller, animated: true)
        UIView.animate(withDuration: 0.2) {
            cell.transform = .identity
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.news.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCell", for: indexPath) as! PostCollectionViewCell
        cell.setupData(withData: viewModel.news[indexPath.row])
        cell.accessibilityIdentifier = "postCell\(indexPath.row)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = DetailPostViewController()
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        pushWithAnimationCelll(nextViewcontroller: detailViewController, currentCell: cell)
    }
}

