// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "SwiftAssertions",
    products: [
        .library(
            name: "SwiftAssertions",
            targets: ["SwiftAssertions"]),
    ],
    targets: [
        .target(
            name: "SwiftAssertions"),
        .testTarget(
            name: "SwiftAssertionsTests",
            dependencies: ["SwiftAssertions"]
        ),
    ]
)
