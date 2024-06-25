//
//  DetailPostViewController.swift
//  AutoDoc
//
//  Created by Артем Соловьев on 25.06.2024.
//

import UIKit

final class DetailPostViewController: UIViewController {
    
    //MARK: - Variables
    private let titleFontSize: CGFloat = 20
    private let descriptionFontSize: CGFloat = 15
    private let dateFontSize: CGFloat = 12
    private let multiplierForIpad: CGFloat = 1.5
    private let spacing: CGFloat = 10
    private let heightOfImage: CGFloat = 400
    
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
        label.font = .systemFont(ofSize: DeviceChecker.isIpad() ? titleFontSize * multiplierForIpad : titleFontSize, weight: .bold)
        return label
    }()
    
    private lazy var descriptionOfPost: UILabel = {
        let label = UILabel()
        label.text = "Итальянский производитель кузовов Touring Superleggera работает над чем-то захватывающим"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = .systemFont(ofSize: DeviceChecker.isIpad() ? descriptionFontSize * multiplierForIpad : descriptionFontSize, weight: .medium)
        label.textColor = .gray
        return label
    }()
    
    private lazy var dateOfPost: UILabel = {
        let label = UILabel()
        label.text = "24.02.2024"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = .systemFont(ofSize: DeviceChecker.isIpad() ? dateFontSize * multiplierForIpad : dateFontSize, weight: .regular)
        label.textColor = .systemGray
        return label
    }()
    
    //MARK: - Lifecycle
    convenience init(image: UIImage, title: String, data: News) {
        self.init()
        detailPostImageView.image = image
        titleOfPost.text = title
        descriptionOfPost.text = data.description
        dateOfPost.text = data.publishedDate
    }
    
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
        detailPostImageView.pinToLeftSafeArea(equalTo: view, withOffset: spacing)
        detailPostImageView.pinToRightSafeArea(equalTo: view, withOffset: spacing)
        detailPostImageView.pinToTopSafeArea(equalTo: view)
        detailPostImageView.setHeight(equalTo: DeviceChecker.getHeightOfImageInDetailView())
        
        titleOfPost.activateAnchor()
        titleOfPost.pinToTop(equalTo: detailPostImageView, withOffset: 20)
        titleOfPost.pinToLeftSafeArea(equalTo: view, withOffset: spacing)
        titleOfPost.pinToRightSafeArea(equalTo: view, withOffset: spacing)
        
        descriptionOfPost.activateAnchor()
        descriptionOfPost.pinToTop(equalTo: titleOfPost, withOffset: 5)
        descriptionOfPost.pinToLeftSafeArea(equalTo: view, withOffset: spacing)
        descriptionOfPost.pinToRightSafeArea(equalTo: view, withOffset: spacing)
        
        dateOfPost.activateAnchor()
        dateOfPost.pinToTop(equalTo: descriptionOfPost, withOffset: 5)
        dateOfPost.pinToLeftSafeArea(equalTo: view, withOffset: spacing)
        dateOfPost.pinToRightSafeArea(equalTo: view, withOffset: spacing)
    }
}
