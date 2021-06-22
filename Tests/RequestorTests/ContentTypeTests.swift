
import Foundation
import Requestor
import XCTest

final class ContentTypeTests: XCTestCase {

    func testForm() throws {
        var request = try URLRequest(url: XCTUnwrap(URL(string: "https://danieltull.co.uk")))
        request.setHeader(.contentType(.form))
        XCTAssertEqual(request.value(forHTTPHeaderField: "Content-Type"), "x-www-form-urlencoded")
    }

    func testHTML() throws {
        var request = try URLRequest(url: XCTUnwrap(URL(string: "https://danieltull.co.uk")))
        request.setHeader(.contentType(.html))
        XCTAssertEqual(request.value(forHTTPHeaderField: "Content-Type"), "text/html")
    }

    func testJSON() throws {
        var request = try URLRequest(url: XCTUnwrap(URL(string: "https://danieltull.co.uk")))
        request.setHeader(.contentType(.json))
        XCTAssertEqual(request.value(forHTTPHeaderField: "Content-Type"), "application/json")
    }

    func testJPEG() throws {
        var request = try URLRequest(url: XCTUnwrap(URL(string: "https://danieltull.co.uk")))
        request.setHeader(.contentType(.jpeg))
        XCTAssertEqual(request.value(forHTTPHeaderField: "Content-Type"), "image/jpeg")
    }

    func testXML() throws {
        var request = try URLRequest(url: XCTUnwrap(URL(string: "https://danieltull.co.uk")))
        request.setHeader(.contentType(.xml))
        XCTAssertEqual(request.value(forHTTPHeaderField: "Content-Type"), "application/xml")
    }
}