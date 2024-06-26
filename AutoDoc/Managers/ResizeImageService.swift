//
//  ResizeImageService.swift
//  AutoDoc
//
//  Created by Артем Соловьев on 26.06.2024.
//

import UIKit

/**
 C API нам приходят картинки в размере 1920 на 1080, это очень большой формат, который телефону очень долго рендерить, появляются commit hittches, плюс память очень сильно сжирается. Поэтому я принял решение написать функцию, которая будет пропорционально уменьгать изображение и уже его отдавать. Это решило проблему не плавного скролла. До этого приложение кушало около 600+ мегабайта памяти. Сейчас же не выходит за рамки 60мб. Очень большой прирост!
*/
class ResizeImageService {
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
       let size = image.size
       
       let widthRatio  = targetSize.width  / size.width
       let heightRatio = targetSize.height / size.height
    
       var newSize: CGSize
       if(widthRatio > heightRatio) {
           newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
       } else {
           newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
       }
       
       let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
       
       UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
       image.draw(in: rect)
       let newImage = UIGraphicsGetImageFromCurrentImageContext()
       UIGraphicsEndImageContext()
       
       return newImage!
   }
}
