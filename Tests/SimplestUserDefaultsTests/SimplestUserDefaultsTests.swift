//
//  SimplestUserDefaultsTests.swift
//
//
//  Created by Glafira on 4.6.2020.
//

import XCTest
@testable import SimplestUserDefaults

final class SimplestUserDefaultsTests: XCTestCase {

    @SimpleUserDefaults(key: "test_Value", defaultValue: "non-empty")
    public static var test_Value: String?

    @SimpleUserDefaults(key: "test_default", defaultValue: "non-empty")
    public static var test_default: String

    @SimpleUserDefaults(key: "test_bool", defaultValue: true)
    public static var test_bool: Bool

    @SimpleUserDefaults(key: "test_default")
    public static var test_default_optional: String?

    private let loremIpsum = "Lorem ipsum"

    func testNewCorretValue() throws {
        SimplestUserDefaultsTests.test_Value = loremIpsum
        XCTAssertEqual(SimplestUserDefaultsTests.test_Value, loremIpsum)
    }

    func testNilValue() throws {
        SimplestUserDefaultsTests.test_Value = nil
        XCTAssertNil(SimplestUserDefaultsTests.test_Value)
    }

    func testDefaultValue() throws {
        XCTAssertEqual(SimplestUserDefaultsTests.test_default, "non-empty")
    }

    func testBoolValue() throws {
        XCTAssertTrue(SimplestUserDefaultsTests.test_bool)

        SimplestUserDefaultsTests.test_bool.toggle()

        XCTAssertFalse(SimplestUserDefaultsTests.test_bool)
    }

    func testCreateWithoutDefaultOptionaValue() throws {
        XCTAssertNil(SimplestUserDefaultsTests.test_default_optional)

        SimplestUserDefaultsTests.test_default_optional = loremIpsum

        XCTAssertEqual(SimplestUserDefaultsTests.test_default_optional, loremIpsum)
    }

}
