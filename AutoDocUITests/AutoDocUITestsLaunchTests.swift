//
//  AutoDocUITestsLaunchTests.swift
//  AutoDocUITests
//
//  Created by Артем Соловьев on 25.06.2024.
//

import XCTest

final class AutoDocUITestsLaunchTests: XCTestCase {
    
    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()
        
        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
    
    func testPushToDetailPostViewController() throws {
        let app = XCUIApplication()
        app.launch()
        
        let collectionView = app.collectionViews.matching(identifier: "collectionView")
        let cell = collectionView.cells.element(matching: .cell, identifier: "postCell0")
        cell.tap()
        
        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Detail screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
