//
//  recruitment_sdd_study_case_3UITests.swift
//  recruitment-sdd_study_case_3UITests
//
//  Created by Jonathan Kristian on 03/04/24.
//

import XCTest

final class recruitment_sdd_study_case_3UITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testDetailTransactionDetailController() throws {
        let app = XCUIApplication()
        app.launch()
        let mainTable = app.tables.element(boundBy: 0)
        XCTAssertEqual(mainTable.cells.count, 4)
        
        mainTable.cells.element(boundBy: 0).tap()
        XCTAssertEqual(app.staticTexts["Rp.1.000.000"].exists, true )
        XCTAssertEqual(app.staticTexts["Rp.500.000"].exists, true )
        app.navigationBars.buttons.element(boundBy: 0).tap()
        
        mainTable.cells.element(boundBy: 1).tap()
        XCTAssertEqual(app.staticTexts["Rp.159.000"].exists, true )
        XCTAssertEqual(app.staticTexts["Rp.35.000"].exists, true )
        XCTAssertEqual(app.staticTexts["Rp.1.500"].exists, true )
        app.navigationBars.buttons.element(boundBy: 0).tap()
        
        mainTable.cells.element(boundBy: 2).tap()
        XCTAssertEqual(app.staticTexts["Rp.200.000"].exists, true )
        XCTAssertEqual(app.staticTexts["Rp.195.000"].exists, true )
        XCTAssertEqual(app.staticTexts["Rp.5.000.000"].exists, true )
        app.navigationBars.buttons.element(boundBy: 0).tap()
        
        mainTable.cells.element(boundBy: 3).tap()
        XCTAssertEqual(app.staticTexts["Rp.1.000.000"].exists, true )
        XCTAssertEqual(app.staticTexts["Rp.500.000"].exists, true )
    }
    

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
