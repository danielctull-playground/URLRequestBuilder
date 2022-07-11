// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "Requestor",
    platforms: [
        .iOS(.v14),
        .macOS(.v11),
        .tvOS(.v14),
        .watchOS(.v7),
    ],
    products: [
        .library(name: "Requestor", targets: ["Requestor"]),
    ],
    targets: [
        .target(name: "Requestor"),
        .testTarget(name: "RequestorTests", dependencies: ["Requestor"]),
    ]
)
