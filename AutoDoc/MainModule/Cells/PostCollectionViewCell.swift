//
//  PostCollectionViewCell.swift
//  AutoDoc
//
//  Created by Артем Соловьев on 25.06.2024.
//

import UIKit

final class PostCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Variables
    private let titleFontSize: CGFloat = 20
    private let categoryFontSize: CGFloat = 12
    private let multiplierForIpad: CGFloat = 1.5
    private let spacing: CGFloat = 10
    private let spacingOfTitle: CGFloat = 20
    private let cornerRadiusSize: CGFloat = 15
    
    //MARK: - Views items
    private lazy var imageOfPost: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(resource: .car)
        imageView.backgroundColor = .systemGray5
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
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
    
    private lazy var categoryNewsLabel: UILabel = {
        let label = UILabel()
        label.text = "Автоновости"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = .systemFont(ofSize: DeviceChecker.isIpad() ? categoryFontSize * multiplierForIpad : categoryFontSize, weight: .medium)
        label.textColor = .systemGray2
        return label
    }()
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.backgroundColor = .white
        self.contentView.layer.cornerRadius = cornerRadiusSize
        self.contentView.layer.masksToBounds = true
        
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        self.contentView.addSubview(imageOfPost)
        self.contentView.addSubview(titleOfPost)
        self.contentView.addSubview(categoryNewsLabel)
    }
    
    private func setupConstraints() {
        imageOfPost.activateAnchor()
        
        imageOfPost.pinToTopSafeArea(equalTo: contentView)
        imageOfPost.pinToLeftSafeArea(equalTo: contentView)
        imageOfPost.pinToBottomSafeArea(equalTo: contentView)
        imageOfPost.setWidthWithMultiplier(equalTo: contentView, withMultiplier: 0.5)
        
        titleOfPost.activateAnchor()
        titleOfPost.pinToLeft(equalTo: imageOfPost, withOffset: spacing)
        titleOfPost.pinToRightSafeArea(equalTo: contentView, withOffset: spacingOfTitle)
        titleOfPost.pinToTopSafeArea(equalTo: contentView, withOffset: spacingOfTitle)
        
        categoryNewsLabel.activateAnchor()
        categoryNewsLabel.pinToLeft(equalTo: imageOfPost, withOffset: spacing)
        categoryNewsLabel.pinToRightSafeArea(equalTo: contentView, withOffset: spacing)
        categoryNewsLabel.pinToTop(equalTo: titleOfPost, withOffset: spacing)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Configure methods
    func setupData(withData data: News) {
        titleOfPost.text = data.title
        categoryNewsLabel.text = data.categoryType
        if let imageUrl = data.titleImageURL {
            imageOfPost.loadImageUsingCache(withUrl: imageUrl)
        }
    }
}
