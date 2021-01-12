import XCTest
@testable import CoreLayerService

final class CoreLayerServiceTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(CoreLayerService().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
