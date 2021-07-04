// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DeclarativeLayoutKit",
    platforms: [.iOS(.v11)],
    products: [
        .library(name: "DeclarativeLayoutKit", targets: ["DeclarativeLayoutKit"]),
    ],
    
    targets: [
        .target(name: "DeclarativeLayoutKit", path: "Sources/DeclarativeLayoutKit"),
        .testTarget(name: "DeclarativeLayoutKitTests", dependencies: ["DeclarativeLayoutKit"]),
    ],
    swiftLanguageVersions: [.v5]
)
