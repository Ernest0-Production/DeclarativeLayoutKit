import XCTest
@testable import DeclarativeLayoutKit

final class DeclarativeLayoutKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(DeclarativeLayoutKit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
