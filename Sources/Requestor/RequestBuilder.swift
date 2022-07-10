
import Foundation

extension URLRequest {

    public init(@RequestBuilder _ build: () throws -> URLRequest) rethrows {
        self = try build()
    }
}

@resultBuilder
public enum RequestBuilder {

    public static func buildBlock(
        _ url: URL,
        _ headers: Header...
    ) -> URLRequest {
        URLRequest(
            method: .get,
            url: url,
            body: nil,
            headers: headers)
    }

    public static func buildBlock(
        _ url: URL,
        _ body: Body?,
        _ headers: Header...
    ) -> URLRequest {
        URLRequest(
            method: .get,
            url: url,
            body: body,
            headers: headers)
    }

    public static func buildBlock(
        _ method: Method,
        _ url: URL,
        _ body: Body?,
        _ headers: Header...
    ) -> URLRequest {
        URLRequest(
            method: method,
            url: url,
            body: body,
            headers: headers)
    }
}

extension URLRequest {

    init(method: Method, url: URL, body: Body?, headers: [Header]) {
        self.init(url: url)
        setMethod(method)
        setBody(body)
        headers.forEach { setHeader($0) }
    }
}
