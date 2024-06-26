//
//  NewsModel.swift
//  AutoDoc
//
//  Created by Артем Соловьев on 25.06.2024.
//

import Foundation
import UIKit

// MARK: - NewsModel
struct NewsModel: Codable {
    let news: [News]
    let totalCount: Int
}

// MARK: - News
struct News: Codable {
    let id: Int
    let title, description, publishedDate, url: String
    let fullURL: String
    let titleImageURL: String?
    let categoryType: String

    enum CodingKeys: String, CodingKey {
        case id, title, description, publishedDate, url
        case fullURL = "fullUrl"
        case titleImageURL = "titleImageUrl"
        case categoryType
    }
}

struct PostNews {
    let title, description, publishedDate, categoryType: String
    let imageOfPost: UIImage
}
