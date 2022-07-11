
import Foundation

public struct Header {
    fileprivate let field: Field
    fileprivate let value: Kind
}

extension Header {
    public init(field: Field, value: Value) {
        self.init(field: field, value: .single(value))
    }

    public init(field: Field, values: Value...) {
        self.init(field: field, value: .multiple(values))
    }
}

extension URLRequest {

    public mutating func setHeader(_ header: Header) {
        switch header.value {
        case let .single(value):
            setValue(value.rawValue, forHTTPHeaderField: header.field.rawValue)
        case let .multiple(values):
            guard let first = values.first else { return }
            setValue(first.rawValue, forHTTPHeaderField: header.field.rawValue)
            for value in values.dropFirst() {
                addValue(value.rawValue, forHTTPHeaderField: header.field.rawValue)
            }
        }
    }

    public mutating func addHeader(_ header: Header) {
        switch header.value {
        case let .single(value):
            addValue(value.rawValue, forHTTPHeaderField: header.field.rawValue)
        case let .multiple(values):
            for value in values {
                addValue(value.rawValue, forHTTPHeaderField: header.field.rawValue)
            }
        }
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

    fileprivate enum Kind {
        case single(Value)
        case multiple([Value])
    }

    public struct Value {
        let rawValue: String
    }
}

extension Header.Value: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self.init(rawValue: value)
    }
}
