
import Foundation

public struct Header {
    public let field: Field
    public let value: Value
}

extension Header {

    public init(_ field: Field, _ value: Value) {
        self.init(field: field, value: value)
    }
}

extension URLRequest {

    public mutating func setHeader(_ header: Header) {
        setValue(header.value.rawValue, forHTTPHeaderField: header.field.rawValue)
    }
}

// MARK: - Field

extension Header {

    public struct Field {
        let rawValue: String
    }
}

extension Header.Field: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self.init(rawValue: value)
    }
}

// MARK: - Value

extension Header {

    public struct Value {
        let rawValue: String
    }
}

extension Header.Value: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self.init(rawValue: value)
    }
}
