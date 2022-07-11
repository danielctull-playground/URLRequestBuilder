
import Foundation

extension URLRequest {

    public init(@RequestBuilder _ build: () throws -> URLRequest) rethrows {
        self = try build()
    }
}

@resultBuilder
public enum RequestBuilder {

    public struct Component<BodyType> {
        fileprivate let method: Method
        fileprivate let url: URL
        fileprivate let body: BodyType
        fileprivate var headers: [Header]
    }

    public static func buildPartialBlock(first: Method) -> Method { first }
    public static func buildPartialBlock(first: URL) -> Component<Void> { Component(url: first) }

    public static func buildPartialBlock(accumulated: Method, next: URL) -> Component<Void> { Component(method: accumulated, url: next) }

    public static func buildPartialBlock(accumulated: Component<Void>, next: Body) -> Component<Body> { accumulated.setting(next) }
    public static func buildPartialBlock<T>(accumulated: Component<T>, next: Header) -> Component<T> { accumulated.adding(next) }

    public static func buildFinalResult(_ component: Component<Void>) -> URLRequest { URLRequest(component: component) }
    public static func buildFinalResult(_ component: Component<Body>) -> URLRequest { URLRequest(component: component) }
}

extension RequestBuilder.Component where BodyType == Body {

    init(method: Method = .get, url: URL, body: Body, headers: [Header] = []) {
        self.method = method
        self.url = url
        self.body = body
        self.headers = headers
    }
}

extension RequestBuilder.Component where BodyType == Void {

    init(method: Method = .get, url: URL, headers: [Header] = []) {
        self.method = method
        self.url = url
        self.body = ()
        self.headers = headers
    }

    func setting(_ body: Body) -> RequestBuilder.Component<Body> {
        RequestBuilder.Component<Body>(method: method, url: url, body: body, headers: headers)
    }
}

extension RequestBuilder.Component {

    func adding(_ header: Header) -> Self {
        var component = self
        component.headers += [header]
        return component
    }
}

extension URLRequest {

    init(component: RequestBuilder.Component<Void>) {
        self.init(url: component.url)
        setMethod(component.method)
        component.headers.forEach { setHeader($0) }
    }

    init(component: RequestBuilder.Component<Body>) {
        self.init(url: component.url)
        setMethod(component.method)
        setBody(component.body)
        component.headers.forEach { setHeader($0) }
    }
}
