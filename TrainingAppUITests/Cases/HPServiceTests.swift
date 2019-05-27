//
//  HPServiceTests.swift
//  Vai Chover iOSUITests
//
//  Created by Erich Diniz on 14/05/19.
//  Copyright © 2019 Erich Diniz. All rights reserved.
//

import XCTest
@testable import TrainingApp

class HPServiceTests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app = XCUIApplication()
        
        app.launchArguments.append("--uitesting")

    }
    
    func testGoingThroughOnboarding(){
        app.launch()
//        XCTAssertTrue(app.)
        app.swipeLeft()
        app.swipeLeft()
        app.swipeLeft()
        
        app.buttons["Done"].tap()

//        XCTAssertFalse(app.isDisplayingOnboarding)

    }

}
