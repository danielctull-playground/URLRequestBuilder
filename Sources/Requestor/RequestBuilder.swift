
import Foundation

extension URLRequest {

    public init(@RequestBuilder _ build: () throws -> URLRequest) rethrows {
        self = try build()
    }
}

@resultBuilder
public enum RequestBuilder {

    public struct Component {
        fileprivate let method: Method?
        fileprivate let url: URL
        fileprivate var body: Body?
        fileprivate var headers: [Header]

        init(method: Method? = nil, url: URL, body: Body? = nil, headers: [Header] = []) {
            self.method = method
            self.url = url
            self.body = body
            self.headers = headers
        }
    }

    public static func buildPartialBlock(first: Method) -> Method { first }
    public static func buildPartialBlock(first: URL) -> Component { Component(url: first) }

    public static func buildPartialBlock(accumulated: Method, next: URL) -> Component { Component(method: accumulated, url: next) }

    public static func buildPartialBlock(accumulated: Component, next: Body) -> Component { accumulated.adding(next) }
    public static func buildPartialBlock(accumulated: Component, next: Header) -> Component { accumulated.adding(next) }

    public static func buildFinalResult(_ component: Component) -> URLRequest { URLRequest(component: component) }
}

extension RequestBuilder.Component {

    func adding(_ body: Body) -> Self {
        var component = self
        component.body = body
        return component
    }

    func adding(_ header: Header) -> Self {
        var component = self
        component.headers += [header]
        return component
    }
}

extension URLRequest {

    init(component: RequestBuilder.Component) {
        self.init(url: component.url)
        if let method = component.method { setMethod(method) }
        if let body = component.body { setBody(body) }
        component.headers.forEach { setHeader($0) }
    }
}
