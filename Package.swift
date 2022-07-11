// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "URLRequestBuilder",
    platforms: [
        .iOS(.v14),
        .macOS(.v11),
        .tvOS(.v14),
        .watchOS(.v7),
    ],
    products: [
        .library(name: "URLRequestBuilder", targets: ["URLRequestBuilder"]),
    ],
    targets: [
        .target(name: "URLRequestBuilder"),
        .testTarget(name: "URLRequestBuilderTests", dependencies: ["URLRequestBuilder"]),
    ]
)
