// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SimplestUserDefaults",
    platforms: [
        .macOS(.v10_14), .iOS(.v11)
    ],
    products: [
        .library(
            name: "SimplestUserDefaults",
            targets: ["SimplestUserDefaults"]),
    ],
    targets: [
        .target(
            name: "SimplestUserDefaults",
            dependencies: []),
        .testTarget(
            name: "SimplestUserDefaultsTests",
            dependencies: ["SimplestUserDefaults"]),
    ]
)
