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
    @MainActor
    func getNews() async {
        do {
            let newsFromApi = try await networkManager.getNews()
            news = newsFromApi
        } catch {
            print("Не удалось загрузить новости, ошибка: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func fetchMoreNews() async {
        URL.nextPage()
        do {
            let newsFromApi = try await networkManager.getNews()
            news += newsFromApi
        } catch {
            print("Не удалось загрузить новости, ошибка: \(error.localizedDescription)")
        }
    }
}
