import Foundation

public struct Method {
    fileprivate let rawValue: String
}

extension Method: ExpressibleByStringLiteral {

    public init(stringLiteral value: String) {
        self.init(rawValue: value)
    }
}

extension Method {
    public static let delete = Method(rawValue: "DELETE")
    public static let get = Method(rawValue: "GET")
    public static let head = Method(rawValue: "HEAD")
    public static let post = Method(rawValue: "POST")
    public static let put = Method(rawValue: "PUT")
    public static let trace = Method(rawValue: "TRACE")
}

extension URLRequest {

    public mutating func setMethod(_ method: Method) {
        httpMethod = method.rawValue
    }
}
