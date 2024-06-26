//
//  NSLayoytAnchorExtension.swift
//  AutoDoc
//
//  Created by Артем Соловьев on 25.06.2024.
//

import UIKit

//MARK: - Расширение для более удобной работы с якорями
extension UIView {
    //MARK: - Отключение маски и перевод в констрейнты
    func activateAnchor() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: - Установка якорей
    func pinCenterHorizontal(equalTo view: UIView, withOffset offset: CGFloat = 0) -> NSLayoutConstraint {
        let centerConstarint = self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: offset)
        return centerConstarint
    }
    
    func pinCenterVertical(equalTo view: UIView, withOffset offset: CGFloat = 0) -> NSLayoutConstraint {
        let centerConstarint = self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: offset)
       return centerConstarint
    }
    
    func pinToLeftSafeArea(equalTo view: UIView, withOffset offset: CGFloat = 0) -> NSLayoutConstraint {
        let leftConstraint = self.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: offset)
        return leftConstraint
    }
    
    func pinToRightSafeArea(equalTo view: UIView, withOffset offset: CGFloat = 0) -> NSLayoutConstraint {
        let rightConstraint = self.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -offset)
        return rightConstraint
    }
    
    func pinToLeft(equalTo view: UIView, withOffset offset: CGFloat = 0) -> NSLayoutConstraint {
        let leftConstraint = self.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: offset)
        return leftConstraint
    }
    
    func pinToRight(equalTo view: UIView, withOffset offset: CGFloat = 0) -> NSLayoutConstraint {
        let rightConstraint = self.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: -offset)
        return rightConstraint
    }
    
    func pinToTopSafeArea(equalTo view: UIView, withOffset offset: CGFloat = 0) -> NSLayoutConstraint {
        let topConstraint = self.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: offset)
        return topConstraint
    }
    
    func pinToBottomSafeArea(equalTo view: UIView, withOffset offset: CGFloat = 0) -> NSLayoutConstraint {
        let bottomConstraint = self.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: offset)
        return bottomConstraint
    }
    
    func pinToTop(equalTo view: UIView, withOffset offset: CGFloat = 0) -> NSLayoutConstraint {
        let topConstraint = self.topAnchor.constraint(equalTo: view.bottomAnchor, constant: offset)
        return topConstraint
    }
    
    func pinToBottom(equalTo view: UIView, withOffset offset: CGFloat = 0) -> NSLayoutConstraint {
        let bottomConstraint = self.bottomAnchor.constraint(equalTo: view.topAnchor, constant: offset)
        return bottomConstraint
    }
    
    //MARK: - Установка размеров
    func setWidth(equalTo width: CGFloat) -> NSLayoutConstraint {
        let widthConstraint = self.widthAnchor.constraint(equalToConstant: width)
        return widthConstraint
    }
    
    func setWidthWithMultiplier(equalTo view: UIView, withMultiplier miltiplier: CGFloat) -> NSLayoutConstraint {
        let widthConstraint = self.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: miltiplier)
        return widthConstraint
    }
    
    func setHeight(equalTo height: CGFloat) -> NSLayoutConstraint {
        let heightConstraint = self.heightAnchor.constraint(equalToConstant: height)
        return heightConstraint
    }
}
