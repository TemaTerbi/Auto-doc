//
//  AsyncImageLoader.swift
//  AutoDoc
//
//  Created by Артем Соловьев on 25.06.2024.
//

import UIKit

let imageCache = NSCache<NSString, AnyObject>()
let networkServive = NetworkManager()

extension UIImageView {
    func loadImageUsingCache(withUrl urlString : String) {
        let url = URL(string: urlString)
        self.image = nil

        // Проверяем кэш на наличие фото
        if let cachedImage = imageCache.object(forKey: urlString as NSString) as? UIImage {
            DispatchQueue.main.async(qos: .userInitiated) { [weak self] in
                guard let self = self else { return }
                self.image = cachedImage
                return
            }
        }

        // Если нет в кэше, то качаем
        if let url = url {
            Task(priority: .userInitiated) {
                let image = try await networkServive.loadImage(withUrl: url)
                
                DispatchQueue.main.async(qos: .userInitiated) { [weak self] in
                    guard let self = self else { return }
                    imageCache.setObject(image, forKey: urlString as NSString)
                    self.image = image
                }
            }
        }
    }
}
