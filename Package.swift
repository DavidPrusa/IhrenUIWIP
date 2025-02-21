// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "IhrenUI",
    platforms: [.iOS(
        .v15
    )],
    products: [
        .library(
            name: "IhrenUI",
            targets: ["IhrenUI"]
        ),
    ],
    targets: [
        .target(
            name: "IhrenUI",
            resources: [
                .process(
                    "Resources"
                )
            ]
        )
    ]
)
