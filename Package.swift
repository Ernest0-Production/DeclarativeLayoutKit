// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DeclarativeLayoutKit",
    platforms: [.iOS(.v10)],
    products: [
        .library(name: "DeclarativeLayoutKit", targets: ["Layouting", "Chaining"]),
        .library(name: "DeclarativeLayoutKit/Layouting", targets: ["Layouting"]),
        .library(name: "DeclarativeLayoutKit/Chaining", targets: ["Chaining"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SnapKit/SnapKit.git", from: "5.0.0"),
    ],
    targets: [
        .target(name: "Layouting", dependencies: ["SnapKit"], path: "Sources/DeclarativeLayoutKit/Layouting"),
        .target(name: "Chaining", path: "Sources/DeclarativeLayoutKit/Chaining"),

        .testTarget(name: "LayoutingTests", dependencies: ["Layouting"]),
    ],
    swiftLanguageVersions: [.v5]
)
