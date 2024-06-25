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
    func pinCenterHorizontal(equalTo view: UIView, withOffset offset: CGFloat = 0) {
        let centerConstarint = self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: offset)
        NSLayoutConstraint.activate([centerConstarint])
    }
    
    func pinCenterVertical(equalTo view: UIView, withOffset offset: CGFloat = 0) {
        let centerConstarint = self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: offset)
        NSLayoutConstraint.activate([centerConstarint])
    }
    
    func pinToLeftSafeArea(equalTo view: UIView, withOffset offset: CGFloat = 0) {
        let leftConstraint = self.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: offset)
        NSLayoutConstraint.activate([leftConstraint])
    }
    
    func pinToRightSafeArea(equalTo view: UIView, withOffset offset: CGFloat = 0) {
        let rightConstraint = self.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -offset)
        NSLayoutConstraint.activate([rightConstraint])
    }
    
    func pinToLeft(equalTo view: UIView, withOffset offset: CGFloat = 0) {
        let leftConstraint = self.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: offset)
        NSLayoutConstraint.activate([leftConstraint])
    }
    
    func pinToRight(equalTo view: UIView, withOffset offset: CGFloat = 0) {
        let rightConstraint = self.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: -offset)
        NSLayoutConstraint.activate([rightConstraint])
    }
    
    func pinToTopSafeArea(equalTo view: UIView, withOffset offset: CGFloat = 0) {
        let topConstraint = self.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: offset)
        NSLayoutConstraint.activate([topConstraint])
    }
    
    func pinToBottomSafeArea(equalTo view: UIView, withOffset offset: CGFloat = 0) {
        let bottomConstraint = self.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: offset)
        NSLayoutConstraint.activate([bottomConstraint])
    }
    
    func pinToTop(equalTo view: UIView, withOffset offset: CGFloat = 0) {
        let topConstraint = self.topAnchor.constraint(equalTo: view.bottomAnchor, constant: offset)
        NSLayoutConstraint.activate([topConstraint])
    }
    
    func pinToBottom(equalTo view: UIView, withOffset offset: CGFloat = 0) {
        let bottomConstraint = self.bottomAnchor.constraint(equalTo: view.topAnchor, constant: offset)
        NSLayoutConstraint.activate([bottomConstraint])
    }
    
    //MARK: - Установка размеров
    func setWidth(equalTo width: CGFloat) {
        let widthConstraint = self.widthAnchor.constraint(equalToConstant: width)
        NSLayoutConstraint.activate([widthConstraint])
    }
    
    func setWidthWithMultiplier(equalTo view: UIView, withMultiplier miltiplier: CGFloat) {
        let widthConstraint = self.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: miltiplier)
        NSLayoutConstraint.activate([widthConstraint])
    }
    
    func setHeight(equalTo height: CGFloat) {
        let heightConstraint = self.heightAnchor.constraint(equalToConstant: height)
        NSLayoutConstraint.activate([heightConstraint])
    }
}
