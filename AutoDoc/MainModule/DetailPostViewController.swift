//
//  DetailPostViewController.swift
//  AutoDoc
//
//  Created by Артем Соловьев on 25.06.2024.
//

import UIKit

class DetailPostViewController: UIViewController {
    
    //Отслеживаем на каком устройстве открыто приложение, чтобы можно было управлять размером текста в ячейке
    private let device = UIScreen.main.traitCollection.userInterfaceIdiom
    
    //MARK: - View items
    private lazy var detailPostImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(resource: .car)
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    private lazy var titleOfPost: UILabel = {
        let label = UILabel()
        label.text = "McLaren может использовать платформу BMW для внедорожника"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = .systemFont(ofSize: device == .pad ? 20 * 1.5 : 20, weight: .bold)
        return label
    }()
    
    private lazy var descriptionOfPost: UILabel = {
        let label = UILabel()
        label.text = "Итальянский производитель кузовов Touring Superleggera работает над чем-то захватывающим"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = .systemFont(ofSize: device == .pad ? 15 * 1.5 : 15, weight: .medium)
        label.textColor = .gray
        return label
    }()
    
    private lazy var dateOfPost: UILabel = {
        let label = UILabel()
        label.text = "24.02.2024"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = .systemFont(ofSize: device == .pad ? 12 * 1.5 : 12, weight: .regular)
        label.textColor = .systemGray
        return label
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(detailPostImageView)
        view.addSubview(titleOfPost)
        view.addSubview(descriptionOfPost)
        view.addSubview(dateOfPost)
    }
    
    private func setupConstraints() {
        detailPostImageView.activateAnchor()
        detailPostImageView.pinToLeftSafeArea(equalTo: view, withOffset: 10)
        detailPostImageView.pinToRightSafeArea(equalTo: view, withOffset: 10)
        detailPostImageView.pinToTopSafeArea(equalTo: view)
        detailPostImageView.setHeight(equalTo: device == .pad ? 400 : 200)
        
        titleOfPost.activateAnchor()
        titleOfPost.pinToTop(equalTo: detailPostImageView, withOffset: 20)
        titleOfPost.pinToLeftSafeArea(equalTo: view, withOffset: 10)
        titleOfPost.pinToRightSafeArea(equalTo: view, withOffset: 10)
        
        descriptionOfPost.activateAnchor()
        descriptionOfPost.pinToTop(equalTo: titleOfPost, withOffset: 5)
        descriptionOfPost.pinToLeftSafeArea(equalTo: view, withOffset: 10)
        descriptionOfPost.pinToRightSafeArea(equalTo: view, withOffset: 10)
        
        dateOfPost.activateAnchor()
        dateOfPost.pinToTop(equalTo: descriptionOfPost, withOffset: 5)
        dateOfPost.pinToLeftSafeArea(equalTo: view, withOffset: 10)
        dateOfPost.pinToRightSafeArea(equalTo: view, withOffset: 10)
    }
}
