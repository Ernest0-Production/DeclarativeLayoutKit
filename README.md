# DeclarativeLayoutKit

A simple and small framework of tools for fast and declarative UI layout.

**Note:** it is powered by [SnapKit](https://github.com/SnapKit/SnapKit)!

|  	  | Advantages 	|
|---	|---------------------------------------------------------------------------------	|
| 🚀 	| Fast view configuration using [property chains](#-property-chaining)|
|  ☺️	| Easily layout using [simplest DSL](#declarative-anchor-builder) based and mixed with [SnapKit DSL](https://github.com/SnapKit/SnapKit)|
| 🎁 	| Extra feature – [stacking views layout](#-bonus-declarative-stack-builder) like UIStackView, but more flexible|
| 🌈 	| Reusable and mixable [view styling](#-declarative-view-styling)|
| 🧩 	| Fully [**SCALABLE**!](#-how-to-extend-functionality)|

## Overview

- [Requirements](#requirements)
- [Usage](#usage)
- [Why should I choose DeclarativeLayoutKit over **alternative**?](#why-should-i-choose-this-framework)
- [Installation](#installation)
- [Credits](#credits)
- [License](#license)

## Requirements

- iOS 10.0+
- Xcode 10.0+
- Swift 5.0+

# Usage

### 🚀 Property chaining
Absolutely **all mutable properties** are represented in the function using code generation powered by [Sourcery](https://github.com/krzysztofzablocki/Sourcery).


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
                // sets a reference of object that calls function(in this case, created UILabel instance) to passed variable
                .assign(to: &myLabel)
                ...
        )
    }
}
```
Closure based actions and gestures:
```swift
UIControl()
    .addAction(for: .valueChanged, { print("value changed") })

UIButton()
    .title("Tap me")
    .onTap({ print("didTap") })

UIView()
    .onTapGesture({ print("Kek") })
    .onLongTapGesture({ print("Cheburek") })

// ⚠️ Don't forget about ARC when use some parent view in action closure, to prevent retain cycle
```
Simple UIStackView helpers:
- `HStackView` - `UIStackView().axis(.horizontal)`
- `VStackView` - `UIStackView().axis(.vertical)`

## Declarative anchor builder
You can set constraints using the same anchor-style. The return type will be `AnchorLayoutBuilder` – a simple container that stores declared anchor's constants. To apply them, just call `build()` function.

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

The frameworks allows two ways to set constants:
- [SnapKit DSL](http://snapkit.io/docs)
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
- own DSL powered by `AnchorLayoutBuilderConstraint`

It has the following template:\
`inset.from(SnapKit.ConstraintPriorityTarget).priority(UILayoutPriority)`

If specify only `inset` it will be applied to the `superview`:
```swift
myView.horizontalAnchor(16).topAnchor(0).bottomAnchor(44)
```
If you want to change сomparison type (less/greater or equal) add `.orLess` or `.orGreater` suffix after `inset`
```swift
myView.bottomAnchor(44.orLess).rightAnchor(8.orGreater.from(secondView))
```

> **⚠️ Default priority of `AnchorLayoutBuilderConstraint` is 999!** It was decided to do so to ensure that the constraints in the case when its could not be applyed, in the future, when updating layout, constraints are automatically re-activated

**Full list of anchors functions:**

`width/height/left/right/top/bottom/centerX/centerYAnchor` - completely equal to `NSLayoutConstraint` anchors

`sizeAnchor(CGSize)` == `widthAcnhor` + `heightAnchor`

`aspectRatioAnchor(multiplier:)` == height / width

`horizontalAnchor` == `leftAnchor` + `rightAnchor`

`verticalAnchor` == `topAnchor` + `bottomAnchor`

`centerAnchor` == `centerXAnchor` + `centerYAnchor`

`edgeAnchors(insets: UIEdgeInsets, to target: SnapKit.ConstraintRelatableTarget?)` - stretches all the edges to `target`. The default `target` is `nil`, which is equivalent to `superview`.

#### View/Builder Composition
You can also add `views` builders to the `superview` builder like this:
```swift
weak var avatarView: UIImageView!
...
let profileView = UIView()
    .backgroundColor(.gray)
    .heightAnchor(100)
    .add({
        UIImageView()
            .assign(to: &avatarView)
            .contentMode(.scaleAspectFit)
            .sizeAnchor(CGSize(width: 40, height: 40))
            .leftAnchor(16)
            .verticalAnchor(0)

        UILabel()
            .numberOfLines(2)
            .rightAnchor(0)
            .leftAnchor(8.from(avatarView).priority(.required))
    })
    // current view is build first, and then it's subviews
    .build()
```
Or using a convenient initializer
```swift

let profileView = UIView({
    UIImageView()
        .assign(to: &avatarView)
        .contentMode(.scaleAspectFit)
        .sizeAnchor(CGSize(width: 40, height: 40))
        .leftAnchor(16)
        .verticalAnchor(0)

    UILabel()
        .numberOfLines(2)
        .rightAnchor(0)
        .leftAnchor(8.from(avatarView).priority(.required))
})
.backgroundColor(.gray)
.heightAnchor(100)
// current view is build first, and then it's subviews
.build()
```

**Note:** if you add builders to a `UIView` (i.e. don't use `anchor-chaining` before call `add(...)`), building will occur **immediately after adding** in `superview`. In other words, the return type of the `build()` function will be `Self` (i.e. `UIView`)
```swift
let profileView = UIView()
    .backgroundColor(.gray)
    .add({
        UIImageView()
            .assign(to: &avatarView)
            .contentMode(.scaleAspectFit)
            .sizeAnchor(CGSize(width: 40, height: 40))
            .leftAnchor(16)
            .verticalAnchor(0)
        UILabel()
            .numberOfLines(2)
            .rightAnchor(0)
            .leftAnchor(8.from(avatarView).priority(.required))
    }) // -> UIView (with already added subviews)
    // and you can continue chainable-configuration (for example by specifying own anchors)
    .heightAnchor(100) // -> AnchorLayoutBuilder
    .build() // -> UIView
```

### 🎁 Bonus! Declarative stack builder
Sometimes `UIStackView` features are not enough for more flexible stacking of `views` with an **individual distribution**.

 The `StackingLayoutBuilder` will help you solve this problem!
```swift
let profileView = HStack {
    UIImageView()
        .assign(to: &avatarView)
        .contentMode(.scaleAspectFit)
        .sizeAnchor(CGSize(width: 40, height: 40))
        .leftSpace(12) // 👀
        .verticalAlignment(.center) // 👀

    UILabel()
        .numberOfLines(2)
        .leftSpace(8) // 👀
        .rightSpace(0) // 👀
}
.backgroundColor(.gray)
```
`HStack` and `VStack` is a function that collects `views` (or `AnchorLayoutBuilder`) and stack them to each other using AutoLayout Constants and return resulting `UIView`.

You can specify:

`left/rightSpace`(in `HStack`), `top/bottomSpace`(in `VStack`) - before and after space of arranged view.

`verticalAlignment`(in `HStack`), `horizontalAlignment`(in `VStack`) - arranged view distribution in **transverse axis**.

`Alignment` type can be:
- `.center` - centered on transverse axis.
- `.fill(sideInset: AnchorLayoutBuilderConstraint = 0)` - stretched along transverse axis.

- `HStack` (similarly in `VStack`):
  - `.custom(top: bottom:)` - custom top and bottom inset (i.e. `AnchorLayoutBuilderConstraint`)
  - `.bottom(...)` - set only bottom inset.
  - `.top(..)` - - set only top inset.

You can continue to use `anchor-chaining` to add additional constraints, but **only before specifying `.space()` and `.alignment()` attributes**!

### 🌈 Declarative View Styling
You no longer need to create many style-different subclasses of your view and dive into a complex inheritance hierarchy.

DeclarativeLayoutKit offers a simple **closure-based** solution for defining styles **with the ability to combine** them:
```swift
UIButton()
    .title("Tap me")
    .set(style: .touchHiglighting(color: .blue), .primaryRounded())
    .onTap({ ... })
```

Just create new `ViewStyle<Target>` in `ViewStyle` extension like static factory:
```swift
extension ViewStyle {
    /// Generic definition is required to be able to support view subclass types
    static func primaryRounded<T: UIView>() -> ViewStyle<T> {
        ViewStyle<T>({ view in
            view.backgroundColor(.systemBlue)
                .cornerRadius(8)
                .borderWidth(4)
                .shadowColor(.darkGray)
                .shadowOpacity(1)
                .shadowRadius(5)
        })
    }

    static func touchHiglighting<T: UIButton>(color: UIColor) -> ViewStyle<T> {
        ViewStyle<T> { button in ... }
    }
}
```

<details>
<summary>About ViewStyle</summary>

The `ViewStyle` is just a wrapper over closure. There's nothing ingenious about it 🤗
```swift
public final class ViewStyle<Target: ViewStyleCompatible> {
    private let handler: (Target) -> ()

    public init(_ handler: @escaping (Target) -> ()) {
        self.handler = handler
    }

    func apply(into target: Target) {
        handler(target)
    }
}
```

</details>

### 🔥 All together
And **finally**, a full-fledged example of using the framework for layout of restaurant previews

*Layout:*

<img src="https://github.com/Ernest0-Production/DeclarativeLayoutKit/blob/master/Assets/example_view.png" width = "600"/>

*Source:*

<img src="https://github.com/Ernest0-Production/DeclarativeLayoutKit/blob/master/Assets/example_code.png" width = "600"/>

## 🧩 How to extend functionality?
##### Add property chaining to another type:
- First way - write type extension with function that return self:
```swift
extension MyCustomView {
    func myProperty(_ value: ValueType) -> Self {
        self.myProperty = value
        return self
    }
}
```
- Second way - using [Sourcery](https://github.com/krzysztofzablocki/Sourcery) apply [Chainable template](https://github.com/Ernest0-Production/DeclarativeLayoutKit/blob/master/Sources/Generator/Chainable.stencil) with your custom view
([see tutorial](https://www.caseyliss.com/2017/3/31/the-magic-of-sourcery)).

##### Extend `AnchorLayoutBuilder`:
Just add extension to `AnchorLayoutBuilderConvertible` type and using `SnapKit DSL` write your own helper:
```swift
extension AnchorLayoutBuilderConvertible {
    func leftTopAnchor(_ inset: CGFloat) -> AnchorLayoutBuilder {
        self.layout({  $0.left.top.equalToSuperview().inset(inset) })
    }
}
```
Or use `.set(constraint: AnchorLayoutBuilderConstraint)` to SnapKit Anchor if you want to use your own DSL:
```swift
extension AnchorLayoutBuilderConvertible {
    func leftTopAnchor(_ constraint: AnchorLayoutBuilderConstraint) -> AnchorLayoutBuilder {
        self.layout({  $0.left.top.set(constraint: constraint) })
    }
}
```

##### Extend DSL:
The `AnchorLayoutBuilderConstraint` is protocol 4 properties:
- `target`
- `inset`(optional)
- `comparisonType` (equal, less, greater)
- `priority`

You can write some extension to it for adding another syntactic sugar and modify this constraint using `MutableAnchorLayoutBuilderConstraint` implementation.

## Why should i choose this framework?

There are already quite a few frameworks for declarative layout like SwiftUI, but DeclarativeLayutKit stands out from them:
- **Small codebase**\
There is no huge number of objects, I'm not "*reinventing the wheel*". This is **not a new layout system** - just a set of helpers: `AnchorLayoutBuilder`, `StackingLayoutBuilder`, `ViewStyle`. This `README` deccription is all you need to know, no redundant documentation needed.\
💉 And you can **easily integrate** the framework into project and **combine it with old/existing layout code**.

- **Extandable**\
The framework is simple and easy to expand. Just apply `Builder` and `Factory` pattern to add new functionality.

- **Separately**\
The framework solves 3 tasks:
  - property-chaining
  - layouting
  - styling

  And you **can use a specific, desired set of features**. See more in [**installation** chapter](#installation)

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
  name: "YourProject",
  dependencies: [
    .package(url: "https://github.com/Ernest0-Production/DeclarativeLayoutKit.git", from: "1.0.0")
  ],
  targets: [
    .target(name: "MyProject", dependencies: ["DeclarativeLayoutKit"])
  ]
)
```

### Credits

- Telegram: @Ernest0N
- [Twitter](https://twitter.com/Ernest0N)


### License

DeclarativeLayoutKit is released under the MIT license. See [LICENSE](https://github.com/Ernest0-Production/DeclarativeLayoutKit/blob/master/LICENSE.md) for details.

---
TODO:
- replaceable layout system (NSLayutConstraints, SnapKit, FrameBasedLayout)
- placeholderable?
- loadable?
