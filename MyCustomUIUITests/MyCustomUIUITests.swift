//
//  MyCustomUIUITests.swift
//  MyCustomUIUITests
//
//  Created by ShichoChin on 2019/03/07.
//  Copyright © 2019 GentleOhige. All rights reserved.
//

import XCTest

class MyCustomUIUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.i
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() {
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testProgressBar() {
        XCUIApplication().tables.staticTexts["ProgressBar"].tap()
        sleep(1)
        XCUIApplication().otherElements.containing(.navigationBar, identifier:"MyCustomUI.ProgressBarView").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
        sleep(3)
    }
    
    
    func testGradientView() {
        XCUIApplication().tables.staticTexts["GrdiationView"].tap()
        sleep(1)
        
    }
    
    func testGradientButton() {
        XCUIApplication().tables.staticTexts["ButtonSample"].tap()
        sleep(1)
        
    }
    
    func testSkeltonDesign() {
        XCUIApplication().tables.staticTexts["SkeltonDesign"].tap()
        sleep(5)
    }
    
}
