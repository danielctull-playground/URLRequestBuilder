
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
        _ body: Body?,
        _ headers: Header...
    ) -> URLRequest {
        var request = URLRequest(url: url)
        headers.forEach { request.setHeader($0) }
        if let body = body { request.setBody(body) }
        return request
    }
}
