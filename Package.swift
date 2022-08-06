// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ColorKit",
    defaultLocalization: .init("en_US"),
    platforms: [.iOS(.v13), .macOS(.v12)],
    products: [
        .library(
            name: "ColorKit",
            targets: ["ColorKit"]),
    ],
    targets: [
        .target(
            name: "ColorKit",
            path: "ColorKit/ColorKit"),
        .testTarget(
            name: "ColorKitTests",
            dependencies: ["ColorKit"],
            path: "ColorKit/ColorKitTests"),
    ]
)
