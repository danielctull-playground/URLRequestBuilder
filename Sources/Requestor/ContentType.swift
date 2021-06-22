
import Foundation

public struct ContentType {
    let rawValue: String
}

extension ContentType: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self.init(rawValue: value)
    }
}

extension ContentType {
    public static let form = Self(rawValue: "x-www-form-urlencoded")
    public static let html = Self(rawValue: "text/html")
    public static let json = Self(rawValue: "application/json")
    public static let jpeg = Self(rawValue: "image/jpeg")
    public static let xml = Self(rawValue: "application/xml")
}

extension Header {

    public static func contentType(_ type: ContentType) -> Self {
        Self(field: "Content-Type", value: Value(rawValue: type.rawValue))
    }
}
