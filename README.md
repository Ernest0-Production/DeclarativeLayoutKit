# DeclarativeLayoutKit


### [Swift Package Manager](https://github.com/apple/swift-package-manager)

Create a `Package.swift` file.

```swift
// swift-tools-version:5.0

import PackageDescription

let package = Package(
  name: "TestProject",
  dependencies: [
    .package(url: "https://github.com/Ernest0-Production/DeclarativeLayoutKit.git", from: "1.0.0")
  ],
  targets: [
    .target(name: "TestProject", dependencies: ["DeclarativeLayoutKit"])
  ]
)


TODO:
- aspectRatio
- stylable?
- placeholderable?
- loadable?
- marginAcnhor
