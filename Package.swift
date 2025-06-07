// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "SwiftVerifiers",
    products: [
        .library(
            name: "SwiftVerifiers",
            targets: ["SwiftVerifiers"]),
    ],
    targets: [
        .target(
            name: "SwiftVerifiers"),
        .testTarget(
            name: "SwiftVerifiersTests",
            dependencies: ["SwiftVerifiers"]
        ),
    ]
)
