//
//  NetworkManager.swift
//  AutoDoc
//
//  Created by Артем Соловьев on 25.06.2024.
//

import Foundation
import UIKit

//MARK: - Base url extension
extension URL {
    static var page = 1
    static var baseUrl = URL(string: "https://webapi.autodoc.ru/api/news/\(page)/15")!
    
    //MARK: - Меняет ссылку, чтобы поменялась страница и подгрузились следующие данные
    static func nextPage() {
        page += 1
        baseUrl = URL(string: "https://webapi.autodoc.ru/api/news/\(page)/15")!
    }
}

//MARK: - Network Service
final class NetworkManager {
    private let session: URLSession
    private let imageCache = NSCache<NSString, AnyObject>()

    // MARK: - Initializers
    init(session: URLSession = .shared) {
        self.session = session
    }

    // MARK: - Methods
    func getNews() async throws -> [PostNews] {
        let (data, _) = try await session.data(from: .baseUrl)
        let news = try JSONDecoder().decode(NewsModel.self, from: data)
        return try await loadDataToPost(newsFromApi: news.news)
    }
    
    //Метод загрузки приложения
    private func loadImage(withUrl url: URL) async throws -> UIImage {
        let (data, _) = try await session.data(from: url)
        
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) as? UIImage {
            return cachedImage
        }
        
        if let image = UIImage(data: data) {
            imageCache.setObject(image, forKey: url.absoluteString as NSString)
            return image
        }
        
        return .car
    }
    
    //Метод, который обрабатывает данные из сети и кладет их сразу в готовую модель
    private func loadDataToPost(newsFromApi: [News]) async throws -> [PostNews] {
        var image: UIImage = UIImage(resource: .car)
        var posts: [PostNews] = []
        try await newsFromApi.asyncForEach { post in
            if let url = URL(string: post.titleImageURL ?? "") {
                image = try await loadImage(withUrl: url)
            }
            
            posts.append(PostNews(title: post.title, description: post.description, publishedDate: post.publishedDate, categoryType: post.categoryType, imageOfPost: image))
        }
        
        return posts
    }
}
