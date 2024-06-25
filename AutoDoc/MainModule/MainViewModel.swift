//
//  MainViewModel.swift
//  AutoDoc
//
//  Created by Артем Соловьев on 25.06.2024.
//

import Foundation
import Combine

//MARK: - ViewModel
final class MainViewModel {
    //MARK: - Variables and instance
    private let networkManager = NetworkManager()
    @Published var news: [News] = []
    
    //MARK: - Api servie methods
    func getNews() async {
        let newsFromApi = try? await networkManager.getNews()
        if let news = newsFromApi {
            self.news = news
        }
    }
}
