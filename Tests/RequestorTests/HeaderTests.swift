
import Foundation
import Requestor
import XCTest

final class HeaderTests: XCTestCase {

    func testSet() throws {
        var request = URLRequest.test
        request.setHeader(Header(field: "key", value: "value"))
        XCTAssertEqual(request.value(forHTTPHeaderField: "key"), "value")
    }

    func testSetMultiple() throws {
        var request = URLRequest.test
        request.setHeader(Header(field: "key", values: "1", "2", "3"))
        XCTAssertEqual(request.value(forHTTPHeaderField: "key"), "1,2,3")
    }

    func testRemove() throws {
        var request = URLRequest.test
        request.setHeader(Header(field: "key", value: "value"))
        request.removeHeader(for: "key")
        XCTAssertNil(request.value(forHTTPHeaderField: "key"))
    }
}
