
import Foundation
import Requestor
import XCTest

final class BodyTests: XCTestCase {

    struct Foo: Encodable {
        let a: String
        let b: Int
    }

    func testJSON() throws {
        var request = try URLRequest.test()
        try request.setBody(.json(Foo(a: "hello", b: 19)))
        XCTAssertEqual(request.value(forHTTPHeaderField: "Content-Type"), "application/json")
        XCTAssertEqual(request.httpBody, #"{"a":"hello","b":19}"#.data(using: .utf8))
    }
}
