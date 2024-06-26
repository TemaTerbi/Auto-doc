//
//  DeviceChecker.swift
//  AutoDoc
//
//  Created by Артем Соловьев on 25.06.2024.
//

import UIKit

//MARK: - Класс, который проверяет на каком устройстве запущено приложение
final class DeviceChecker {
    static func getHeightOfImageInDetailView() -> CGFloat {
        let device = UIScreen.main.traitCollection.userInterfaceIdiom
        return device == .pad ? 400 : 200
    }
    
    static func isIpad() -> Bool {
        let device = UIScreen.main.traitCollection.userInterfaceIdiom
        return device == .pad
    }
}
