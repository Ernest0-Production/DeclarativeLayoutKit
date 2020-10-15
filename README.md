# DeclarativeLayoutKit

TODO English description

Простая и небольшая библиотека инструментов для быстрой и декларативной верстки UI.

**Примечание:** используется [SnapKit](https://github.com/SnapKit/SnapKit)!
В одной из будущих версий SnapKit будет вынесен в отдельный subspec, а ядро будет построенно непосредственно на NSLayoutConstraints.

|  	  | Advantages 	|
|---	|---------------------------------------------------------------------------------	|
| 🚀 	| Fast view configuration using [property chains](#-property-chaining)|
|  ☺️	| Easily layout using [simplest DLS]((#️️️-declarative-anchor-builder)) based and mixed with [SnapKit DLS](https://github.com/SnapKit/SnapKit)|
| 🎁 	| Extra feature – [stacking views layout](#-declarative-stack-builder) like UIStackView, but more flexible|
| 🌈 	| Reusable and mixable [view styling](#-declarative-view-styling)|
| 🧩 	| Fully [**SCALABLE**!](#-how-to-extend-functionality)|

## Overview

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Why should I choose DeclarativeLayoutKit over **alternative**?](#why-should-i-choose-this-framework)
- [Credits](#credits)
- [License](#license)

## Requirements

- iOS 10.0+
- Xcode 10.0+
- Swift 5.0+

## Installation

#### [CocoaPods](https://guides.cocoapods.org/using/using-cocoapods.html)

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

#### [Swift Package Manager](https://github.com/apple/swift-package-manager)

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

# Usage

### 🚀 Property chaining
Absolutely **all mutable properties** are represented in the function using code generation powered by [Stencil](https://github.com/stencilproject/Stencil).


```swift
let myLabel = UILabel()
    .numberOfLines(0)
    .text("Hello buddy")
    .backgroundColor(.blue)
    .isHighlighted(true)
    .borderWidth(1)
    .borderColor(.cyan)
```

Currently, property chaining is supported in the following types:
`UIView`, `UIControl`, `UILabel`, `UIImageView`, `UIScrollView`, `UITextView`, `UITableView`, `UICollectionView`, `UITextField`, `UIButton`, `UISlider`, `UISwitch`, `UIStackView`.
> You can also easily generate functions for other types – [see how](#add-property-chaining-to-another-type)

### ☺️ Declarative anchor builder
TODO
```swift
```
### 🎁 Declarative stack builder
TODO
```swift
```
### 🌈 Declarative View Styling
TODO
```swift
```

### 🔥 All together
```swift
```

## 🧩 How to extend functionality?
##### Add property chaining to another type:
```swift
```
## Why should i choose this framework?
There are already quite a few frameworks for declarative layout like SwiftUI, but DeclarativeLayutKit stands out from them:
- Small codebase
-
-
-


### Credits

- Telegram: @Ernest0N
- [Twitter](https://twitter.com/Ernest0N)


### License

DeclarativeLayoutKit is released under the MIT license. See LICENSE for details.

---
TODO:
- replaceable layout system
- placeholderable?
- loadable?
