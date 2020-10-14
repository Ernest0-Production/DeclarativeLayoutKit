# DeclarativeLayoutKit

TODO English description

Простая и небольшая библиотека инструментов для быстрой и декларативной верстки UI.

**Примечание:** используется [SnapKit](https://github.com/SnapKit/SnapKit)!
В одной из будущих версий SnapKit будет вынесен в отдельный subspec, а ядро будет построенно непосредственно на NSLayoutConstraints.

### Advantage
- Fast view configuration using [property chains](#property-chaining)
- Easily layout using simplest [DLS (based and mixed with SnapKit DLS)](#declarative-anchor-builder)
- Extra feature – [stacking views layout](#declarative-view-styling) like UIStackView, but more flexible
- Reusable and mixable [view styling](declarative-view-styles)
- It is fully **SCALABLE**!

## Contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Credits](#credits)
- [License](#license)

## Requirements

- iOS 10.0+
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
    .package(url: "https://github.com/Ernest0-Production/DeclarativeLayoutKit.git", from: "2.0.4")
  ],
  targets: [
    .target(name: "MyProject", dependencies: ["DeclarativeLayoutKit"])
  ]
)
```

## Usage

### Property chaining
TODO
### Declarative anchor builder
TODO
### Declarative stack builder
TODO
### Declarative View Styling
TODO

## Credits

- Telegram: @Ernest0N
- [Twitter](https://twitter.com/Ernest0N)


## License

DeclarativeLayoutKit is released under the MIT license. See LICENSE for details.

TODO:
- replaceable layout system
- placeholderable?
- loadable?
