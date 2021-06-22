
import Foundation
import Requestor
import XCTest

final class HeaderTests: XCTestCase {

    func testAdd() throws {
        var request = try URLRequest(url: XCTUnwrap(URL(string: "https://danieltull.co.uk")))
        request.addHeader(Header("key", "value"))
        XCTAssertEqual(request.value(forHTTPHeaderField: "key"), "value")
    }
}
