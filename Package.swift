// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DeclarativeLayoutKit",
    platforms: [.iOS(.v10)],
    products: [
        .library(
            name: "DeclarativeLayoutKit",
            targets: ["DeclarativeLayoutKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SnapKit/SnapKit.git", from: "5.0.0"),
    ],
    targets: [
        .target(
            name: "DeclarativeLayoutKit",
            dependencies: ["SnapKit"]),
    ]
)
