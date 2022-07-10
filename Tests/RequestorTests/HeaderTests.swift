
import Foundation
import Requestor
import XCTest

final class HeaderTests: XCTestCase {

    func testSet() throws {
        var request = try URLRequest.test()
        request.setHeader(Header("key", "value"))
        XCTAssertEqual(request.value(forHTTPHeaderField: "key"), "value")
    }

    func testRemove() throws {
        var request = try URLRequest.test()
        request.setHeader(Header("key", "value"))
        request.removeHeader(for: "key")
        XCTAssertNil(request.value(forHTTPHeaderField: "key"))
    }
}
