//
//  AutoDocTests.swift
//  AutoDocTests
//
//  Created by Артем Соловьев on 25.06.2024.
//

import XCTest
@testable import AutoDoc

final class AutoDocTests: XCTestCase {

    func checkApiService() async throws {
        let apiService = NetworkManager()
        if let news = try? await apiService.getNews() {
            XCTAssert(news.isEmpty)
        }
    }
}
