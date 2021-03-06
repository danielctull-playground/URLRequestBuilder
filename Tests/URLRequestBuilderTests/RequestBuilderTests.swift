
import Foundation
import URLRequestBuilder
import XCTest

final class RequestBuilderTests: XCTestCase {

    func testGet() throws {
        let request = URLRequest {
            URL.test
            Body(type: "some", content: Data())
            Header(field: "key", value: "value")
        }
        XCTAssertEqual(request.httpMethod, "GET")
        XCTAssertEqual(request.value(forHTTPHeaderField: "key"), "value")
        XCTAssertEqual(request.value(forHTTPHeaderField: "Content-Type"), "some")
        XCTAssertEqual(request.httpBody, Data())
    }

    func testPost() throws {
        let request = URLRequest {
            Method.post
            URL.test
            Body(type: "some", content: Data())
            Header(field: "key", value: "value")
        }
        XCTAssertEqual(request.httpMethod, "POST")
        XCTAssertEqual(request.value(forHTTPHeaderField: "key"), "value")
        XCTAssertEqual(request.value(forHTTPHeaderField: "Content-Type"), "some")
        XCTAssertEqual(request.httpBody, Data())
    }
}
