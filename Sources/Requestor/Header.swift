
import Foundation

public struct Header {
    public let field: Field
    public let value: Value

    public init(field: Field, value: Value) {
        self.field = field
        self.value = value
    }
}

extension URLRequest {

    public mutating func setHeader(_ header: Header) {
        setValue(header.value.rawValue, forHTTPHeaderField: header.field.rawValue)
    }

    public mutating func removeHeader(for field: Header.Field) {
        setValue(nil, forHTTPHeaderField: field.rawValue)
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
