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
    private let imageCache = NSCache<NSString, UIImage>()
    private let resizeImageServive = ResizeImageService()
    
    //Будем получать картинку 600 на 600
    private let sizeOfImage: Int = 600
    
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
    
    //Метод загрузки изображения
    private func loadImage(withUrl url: URL) async throws -> UIImage {
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            return cachedImage
        }
        
        let (data, _) = try await session.data(from: url)
        
        if let image = UIImage(data: data) {
            imageCache.setObject(image, forKey: url.absoluteString as NSString)
            return image
        }
        return .car
    }
    
    //Метод, который обрабатывает данные из сети и кладет их сразу в готовую модель
    private func loadDataToPost(newsFromApi: [News]) async throws -> [PostNews] {
        var posts: [PostNews] = []
        try await withThrowingTaskGroup(of: PostNews?.self) { group in
            for post in newsFromApi {
                group.addTask {
                    if let url = URL(string: post.titleImageURL ?? "") {
                        let image = try await self.loadImage(withUrl: url)
                        let resizedImage = self.resizeImageServive.resizeImage(image: image, targetSize: CGSize(width: self.sizeOfImage, height: self.sizeOfImage))
                        return PostNews(title: post.title, description: post.description, publishedDate: post.publishedDate, categoryType: post.categoryType, imageOfPost: resizedImage)
                    }
                    return nil
                }
            }
            
            for try await post in group {
                if let post = post {
                    posts.append(post)
                }
            }
        }
        return posts
    }
}
