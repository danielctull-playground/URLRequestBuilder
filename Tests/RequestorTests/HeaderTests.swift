
import Foundation
import Requestor
import XCTest

final class HeaderTests: XCTestCase {

    func testSet() throws {
        var request = URLRequest.test
        request.setHeader(Header(field: "key", value: "value"))
        XCTAssertEqual(request.value(forHTTPHeaderField: "key"), "value")
    }

    func testRemove() throws {
        var request = URLRequest.test
        request.setHeader(Header(field: "key", value: "value"))
        request.removeHeader(for: "key")
        XCTAssertNil(request.value(forHTTPHeaderField: "key"))
    }
}
