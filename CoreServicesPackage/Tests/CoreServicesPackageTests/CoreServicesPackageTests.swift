import XCTest
@testable import CoreServicesPackage

final class CoreServicesPackageTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(CoreServicesPackage().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
