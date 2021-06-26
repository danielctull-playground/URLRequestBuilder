
import Foundation
import XCTest

extension URL {

    static func test() throws -> Self {
        try XCTUnwrap(URL(string: "https://danieltull.co.uk"))
    }
}

extension URLRequest {

    static func test() throws -> Self {
        try URLRequest(url: .test())
    }
}
