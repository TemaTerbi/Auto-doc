//
//  NetworkManager.swift
//  AutoDoc
//
//  Created by Артем Соловьев on 25.06.2024.
//

import Foundation

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

    // MARK: - Initializers
    init(session: URLSession = .shared) {
        self.session = session
    }

    // MARK: - Methods
    func getNews() async throws -> [News] {
        let (data, _) = try await session.data(from: .baseUrl)
        let news = try JSONDecoder().decode(NewsModel.self, from: data)
        return news.news
    }
}
