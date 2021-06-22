
import Foundation

public struct Body {
    let type: ContentType
    let content: Data
    
    public init(type: ContentType, content: Data) {
        self.type = type
        self.content = content
    }
}

extension URLRequest {

    public mutating func setBody(_ body: Body) {
        httpBody = body.content
        setHeader(.contentType(body.type))
    }
}

// MARK: - JSON

extension Body {

    public static func json<Value: Encodable>(_ value: Value) throws -> Body {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .sortedKeys
        return Body(type: .json, content: try encoder.encode(value))
    }
}
