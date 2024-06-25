//
//  PostCollectionViewCell.swift
//  AutoDoc
//
//  Created by Артем Соловьев on 25.06.2024.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    
    private let device = UIScreen.main.traitCollection.userInterfaceIdiom
    
    private lazy var imageOfPost: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(resource: .car)
        imageView.image = image
        imageView.contentMode = .center
        imageView.clipsToBounds = true
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
    
    private lazy var categoryNewsLabel: UILabel = {
        let label = UILabel()
        label.text = "Автоновости"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = .systemFont(ofSize: device == .pad ? 12 * 1.5 : 12, weight: .medium)
        label.textColor = .systemGray2
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.backgroundColor = .white
        self.contentView.layer.cornerRadius = 15
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
        titleOfPost.pinToLeft(equalTo: imageOfPost, withOffset: 10)
        titleOfPost.pinToRightSafeArea(equalTo: contentView, withOffset: -20)
        titleOfPost.pinToTopSafeArea(equalTo: contentView, withOffset: 20)
        
        categoryNewsLabel.activateAnchor()
        categoryNewsLabel.pinToLeft(equalTo: imageOfPost, withOffset: 10)
        categoryNewsLabel.pinToRightSafeArea(equalTo: contentView, withOffset: -20)
        categoryNewsLabel.pinToTop(equalTo: titleOfPost, withOffset: 10)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
