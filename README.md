# DeclarativeLayoutKit

TODO English description

A simple and small framework of tools for fast and declarative UI layout.

**Note:** it is powered by [SnapKit](https://github.com/SnapKit/SnapKit)!

|  	  | Advantages 	|
|---	|---------------------------------------------------------------------------------	|
| 🚀 	| Fast view configuration using [property chains](#-property-chaining)|
|  ☺️	| Easily layout using [simplest DSL]((#️️️-declarative-anchor-builder)) based and mixed with [SnapKit DSL](https://github.com/SnapKit/SnapKit)|
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

#### 😋 And some extra syntactic sugar:
Assignable to variable:
```swift
class ViewController: UIViewController {
    weak var myLabel: UILabel!

    override func loadView() {
        ...
        view.addSubview(
            UILabel()
                .numberOfLines(0)
                .text("Voila")
                // sets a reference to the object that calls function(in this case, created UILabel instance) to passed variable
                .assign(to: &myLabel) 
                ...
        )
    }
}
```
Closure based actions and gestures:
```swift
UIButton()
    .title("Tap me")
    .onTap({ print("didTap") })

UIView()
    .onTapGesture({ print("Kek") })
    .onLongTapGesture({ print("Cheburek") })
    
**⚠️ Don't forget about ARC when use some parent view in action closure, to prevent retain cycle**
```

`HStackView` - `UIStackView().axis(.horizontal)`\
`VStackView` - `UIStackView().axis(.vertical)`

Currently, property chaining is supported in the following types:
`UIView`, `UIControl`, `UILabel`, `UIImageView`, `UIScrollView`, `UITextView`, `UITableView`, `UICollectionView`, `UITextField`, `UIButton`, `UISlider`, `UISwitch`, `UIStackView`.
> You can also easily generate functions for other types – [see how](#add-property-chaining-to-another-type)


## Declarative anchor builder
You can set constrints using the same style by setting anchors. The return type is `AnchorLayoutBuilder` – a simple container that stores declared anchor's constants. To apply them, just call `build()` function.

```swift
let myLabel = UILabel()
    .numberOfLines(0) // -> UIView
    ...
    .heightAnchor(0) // -> AnchorLayoutBuilder (same below)
    .topAnchor(16.from(anotherView.snp.bottom))
    .leftAnchor(24)
    .rightAnchor(24.orLess.pririty(750))
    .build() // -> UIView (with applyed constraints)
```

The frameworks allows two ways to install constants:
- SnapKit DSL](http://snapkit.io/docs):
```swift
let myLabel = UILabel()
    .numberOfLines(0)
    .layout({
        $0.height.equalTo(0)
        $0.top.equalTo(anotherView.snp.bottom).inset(16)
        $0.left.equalToSuperview().inset(14)
        $0.right.lessThanOrEqualToSuperview().inset(24)
    })
    .build()
```
- own DSL: `AnchorLayoutBuilderConstraint`

It has the following template:\
`<inset>.from(<SnapKit.ConstraintPriorityTarget>).priority(UILayoutPriority)`

If specify only `<inset>` it will be applied to the `superview`:
```swift
myView.horizontalAnchor(16).topAnchor(0).bottomAnchor(44)
```
If you want to change сomparison type (less/greater or equal) add `.orLess` or `.orGreater` suffx after `<inset>`
```swift
myView.bottomAnchor(44.orLess).rightAnchor(8.orGreater.from(secondView))
```

> **⚠️ Default priority of `AnchorLayoutBuilderConstraint` 999.** It was decided to do so to ensure that the constraints in the case when its could not be applyid, in the future, when updaing layout, constraints are automatically re-activated

Full list of anchors functions:\
`width/height/left/right/top/bottomAnchor/centerX/centerYAnchor` - no comments\
`sizeAnchor(CGSize)` == `widthAcnhor` + `heightAnchor`\
`aspectRatioAnchor(multiplier:)` == height / width\
`horizontalAnchor` == `leftAnchor` + `rightAnchor`\
`vertivalAnchor` == `topAnchor` + `bottomAnchor`\
`centerAnchor` == `centerXAnchor` + `centerYAnchor`\
`stretchAnchors(insets: UIEdgeInsets, to target: SnapKit.ConstraintRelatableTarget?)` - stretches all the edges to target. By default  target is `nil` which is equivalent to `superview`.


### 🎁 Bonus. Declarative stack builder
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
TODO
There are already quite a few frameworks for declarative layout like SwiftUI, but DeclarativeLayutKit stands out from them:
- Small codebase
- Extandable
- Easy to add into a project
- Modulized


### Credits

- Telegram: @Ernest0N
- [Twitter](https://twitter.com/Ernest0N)


### License

DeclarativeLayoutKit is released under the MIT license. See LICENSE for details.

---
TODO:
- replaceable layout system (NSLayutConstraints, SnapKit, FrameBasedLayout)
- placeholderable?
- loadable?
