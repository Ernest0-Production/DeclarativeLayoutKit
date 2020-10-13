# DeclarativeLayoutKit


## Requirements

- iOS 10.0+ / Mac OS X 10.12+ / tvOS 10.0+
- Xcode 10.0+
- Swift 5.0+

## Installation

### [CocoaPods](https://guides.cocoapods.org/using/using-cocoapods.html)

```ruby
# Podfile
use_frameworks!

target 'YOUR_TARGET_NAME' do
    pod 'DeclarativeLayoutKit'
end
```

Replace `YOUR_TARGET_NAME` and then, in the `Podfile` directory, type:

```bash
$ pod install
```

### [Swift Package Manager](https://github.com/apple/swift-package-manager)

Create a `Package.swift` file.

```swift
// swift-tools-version:5.0

import PackageDescription

let package = Package(
  name: "TestProject",
  dependencies: [
    .package(url: "https://github.com/Ernest0-Production/DeclarativeLayoutKit.git", from: "2.0.3")
  ],
  targets: [
    .target(name: "MyProject", dependencies: ["DeclarativeLayoutKit"])
  ]
)


TODO:
- placeholderable?
- loadable?
