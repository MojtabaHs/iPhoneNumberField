//
//  iPhoneNumberFieldDemoUITests.swift
//  iPhoneNumberFieldDemoUITests
//
//  Created by Seyed Mojtaba Hosseini Zeidabadi on 2/26/25.
//

import XCTest

final class iPhoneNumberFieldDemoUITests: XCTestCase {

    func testIssue118() throws {
        let app = XCUIApplication()
        app.launchArguments.append("UIT-GHI-118")
        app.launch()

        let usFlag = "🇺🇸"
        let expectedFlag = "🇦🇫"

        // I have set up the iPhoneNumberField like:
        // @State private var selectedCountry: String = "US"
        let selectYourCountryCodeButton = app.buttons["Select your country code"]
        let countryFlag = selectYourCountryCodeButton.staticTexts.firstMatch
        XCTAssert(countryFlag.label.contains(usFlag), "Expected US flag")

        // When I change the country flag
        selectYourCountryCodeButton.tap()

        // Find and tap the Afghanistan entry using the flag
        let allStaticTexts = app.tables.staticTexts.allElementsBoundByIndex
        let expectedEntry = try XCTUnwrap(allStaticTexts.first { $0.label.contains(expectedFlag) })
        expectedEntry.tap()

        XCTAssert(countryFlag.label.contains(expectedFlag), "Expected another flag")

        // And begin to type in a phone number
        app.textFields["Phone Number"].tap()
        app.keys["1"].tap()
        app.keys["2"].tap()
        app.keys["3"].tap()

        // the flag just reverts back to US (unexpected).
        XCTAssert(countryFlag.label.contains(expectedFlag), "Expected the flag to stay the same")
    }
}
