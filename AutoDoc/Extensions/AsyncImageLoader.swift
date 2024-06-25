//
//  AsyncImageLoader.swift
//  AutoDoc
//
//  Created by Артем Соловьев on 25.06.2024.
//

import UIKit

let imageCache = NSCache<NSString, AnyObject>()

extension UIImageView {
    func loadImageUsingCache(withUrl urlString : String) {
        let url = URL(string: urlString)
        self.image = nil

        // Проверяем кэш на наличие фото
        if let cachedImage = imageCache.object(forKey: urlString as NSString) as? UIImage {
            self.image = cachedImage
            return
        }

        // Если нет в кэше, то качаем
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }

            DispatchQueue.main.async {
                if let image = UIImage(data: data!) {
                    imageCache.setObject(image, forKey: urlString as NSString)
                    self.image = image
                }
            }

        }).resume()
    }
}
