//
//  ViewControllerExtension.swift
//  AutoDoc
//
//  Created by Артем Соловьев on 25.06.2024.
//

import UIKit

//MARK: - Extension for delegate UICollectionView
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    private func pushWithAnimationCelll(nextViewcontroller controller: UIViewController, currentCell cell: UICollectionViewCell) {
        UIView.animate(withDuration: 0.2) {
            cell.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }
        navigationController?.pushViewController(controller, animated: true)
        UIView.animate(withDuration: 0.2) {
            cell.transform = .identity
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCell", for: indexPath) as! PostCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        let detailViewController = DetailPostViewController()
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        pushWithAnimationCelll(nextViewcontroller: detailViewController, currentCell: cell)
    }
}
