
import Foundation
import Requestor
import XCTest

final class ContentTypeTests: XCTestCase {

    func testForm() throws {
        var request = URLRequest.test
        request.setHeader(.contentType(.form))
        XCTAssertEqual(request.value(forHTTPHeaderField: "Content-Type"), "x-www-form-urlencoded")
    }

    func testHTML() throws {
        var request = URLRequest.test
        request.setHeader(.contentType(.html))
        XCTAssertEqual(request.value(forHTTPHeaderField: "Content-Type"), "text/html")
    }

    func testJSON() throws {
        var request = URLRequest.test
        request.setHeader(.contentType(.json))
        XCTAssertEqual(request.value(forHTTPHeaderField: "Content-Type"), "application/json")
    }

    func testJPEG() throws {
        var request = URLRequest.test
        request.setHeader(.contentType(.jpeg))
        XCTAssertEqual(request.value(forHTTPHeaderField: "Content-Type"), "image/jpeg")
    }

    func testXML() throws {
        var request = URLRequest.test
        request.setHeader(.contentType(.xml))
        XCTAssertEqual(request.value(forHTTPHeaderField: "Content-Type"), "application/xml")
    }
}
