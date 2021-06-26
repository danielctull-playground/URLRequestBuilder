
import Foundation
import Requestor
import XCTest

final class RequestBuilderTests: XCTestCase {

    func test() throws {
        let request = try URLRequest {
            try URL.test()
            Body(type: "some", content: Data())
            Header("key", "value")
        }
        XCTAssertEqual(request.value(forHTTPHeaderField: "key"), "value")
        XCTAssertEqual(request.value(forHTTPHeaderField: "Content-Type"), "some")
        XCTAssertEqual(request.httpBody, Data())
    }
}
