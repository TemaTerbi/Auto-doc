//
//  AsyncForEach.swift
//  AutoDoc
//
//  Created by Артем Соловьев on 26.06.2024.
//

import Foundation

extension Sequence {
    func asyncForEach(
        _ operation: (Element) async throws -> Void
    ) async rethrows {
        for element in self {
            try await operation(element)
        }
    }
}
