//
//  MainViewModel.swift
//  AutoDoc
//
//  Created by Артем Соловьев on 25.06.2024.
//

import Foundation
import Combine
import UIKit

//MARK: - ViewModel
final class MainViewModel {
    //MARK: - Variables and instance
    private let networkManager = NetworkManager()
    @Published var news: [PostNews] = []
    
    //MARK: - Api servie methods
    func getNews() async {
        let newsFromApi = try? await networkManager.getNews()
        if let news = newsFromApi {
            self.news = news
        }
    }
    
    func fetchMoreNews() async {
        URL.nextPage()
        let newsFromApi = try? await networkManager.getNews()
        if let news = newsFromApi {
            self.news += news
        }
    }
}
