
import Foundation
import XCTest

extension URLRequest {

    static func test() throws -> Self {
        try URLRequest(url: XCTUnwrap(URL(string: "https://danieltull.co.uk")))
    }
}
