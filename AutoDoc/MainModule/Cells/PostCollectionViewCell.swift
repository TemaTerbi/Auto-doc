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
    private(set) lazy var imageOfPost: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray5
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private(set) lazy var titleOfPost: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = .systemFont(ofSize: DeviceChecker.isIpad() ? titleFontSize * multiplierForIpad : titleFontSize, weight: .bold)
        return label
    }()
    
    private lazy var categoryNewsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = .systemFont(ofSize: DeviceChecker.isIpad() ? categoryFontSize * multiplierForIpad : categoryFontSize, weight: .medium)
        label.textColor = .systemGray2
        return label
    }()
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = cornerRadiusSize
        layer.masksToBounds = true
        contentView.backgroundColor = .white
        
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        contentView.addSubview(imageOfPost)
        contentView.addSubview(titleOfPost)
        contentView.addSubview(categoryNewsLabel)
    }
    
    private func setupConstraints() {
        imageOfPost.activateAnchor()
        categoryNewsLabel.activateAnchor()
        titleOfPost.activateAnchor()
        
        NSLayoutConstraint.activate([
            imageOfPost.pinToTopSafeArea(equalTo: contentView),
            imageOfPost.pinToLeftSafeArea(equalTo: contentView),
            imageOfPost.pinToBottomSafeArea(equalTo: contentView),
            imageOfPost.setWidthWithMultiplier(equalTo: contentView, withMultiplier: 0.5),
            
            titleOfPost.pinToLeft(equalTo: imageOfPost, withOffset: spacing),
            titleOfPost.pinToRightSafeArea(equalTo: contentView, withOffset: spacingOfTitle),
            titleOfPost.pinToTopSafeArea(equalTo: contentView, withOffset: spacingOfTitle),
            
            categoryNewsLabel.pinToLeft(equalTo: imageOfPost, withOffset: spacing),
            categoryNewsLabel.pinToRightSafeArea(equalTo: contentView, withOffset: spacing),
            categoryNewsLabel.pinToTop(equalTo: titleOfPost, withOffset: spacing),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Configure methods
    func setupData(withData data: PostNews) {
        DispatchQueue.main.async { 
            self.titleOfPost.text = data.title
            self.categoryNewsLabel.text = data.categoryType
            self.imageOfPost.image = data.imageOfPost
        }
    }
}
