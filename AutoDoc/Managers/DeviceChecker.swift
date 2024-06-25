//
//  DeviceChecker.swift
//  AutoDoc
//
//  Created by Артем Соловьев on 25.06.2024.
//

import UIKit

class DeviceChecker {
    static func getHeightOfImageInDetailView() -> CGFloat {
        let device = UIScreen.main.traitCollection.userInterfaceIdiom
        return device == .pad ? 400 : 200
    }
    
    static func isIpad() -> Bool {
        let device = UIScreen.main.traitCollection.userInterfaceIdiom
        return device == .pad
    }
}
