
import Foundation
import XCTest

extension URL {

    static let test = URL(string: "https://danieltull.co.uk")!
}

extension URLRequest {

    static let test = URLRequest(url: .test)
}
