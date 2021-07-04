# DeclarativeLayoutKit

Declarative and type-safe framework for fast UI layout


|  	  | Advantages 	|
|---	|---------------------------------------------------------------------------------	|
| 🚀 	| Fast view configuration using [property chains](#🚀-property-chaining)|
|  🌈	| Easily layout using [simplest DSL](#🧩-declarative-constraint-builder)| 
| 🎁 	| ***extra_most_usefull*** helpers for [UIStackView](#👨‍👨‍👦‍👦-UIStackView-extra_most_usefull-helpers)|
| 🧩 	| [**SCALABLE**!](#how-to-extend-chaining-functionality)|

## Overview

- [Requirements](#requirements)
- [Usage](#usage)
- [How this framework differs from the others?](#how-this-framework-differs-from-the-others?)
- [Installation](#installation)
- [Credits](#credits)
- [License](#license)

## Requirements

- iOS 11.0
- Xcode 12.5
- Swift 5.4

# Usage

## 🚀 Property chaining
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

### 😋 And some extra syntactic sugar:
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
        )

        ...
    }
}
```
Closure based actions and gestures:
```swift
UIControl()
    .addAction(for: .valueChanged, { print("value changed") })

UIButton()
    .title("Tap me")
    .onTap({ print("didTap") }) // wrap .addAction(for: .touchUpInside, { .. })

UIView()
    .onTapGesture({ print("Kek") })
    .onLongTapGesture({ print("Cheburek") })

// ⚠️ Don't forget about ARC when use some parent view in action closure, to prevent retain cycle
```
## 👨‍👨‍👦‍👦 UIStackView **extra_most_usefull** helpers

Preconfigured stack initializer:

```swift
HorizontalStack([...]) // axis = .horizontal

HorizontalCenterStack([...]) // axis = .horizontal; alignment = .center

TopStack([...]) // axis = .horizontal; alignment = .top

BottomStack([...]) // axis = .horizontal; alignment = .bottom


VerticalStack([...]) // axis = .vertical

VerticalCenterStack([...]) // axis = .vertical; alignment = .center

LeftStack([...]) // axis = .vertical; alignment = .leading

RightStack([...]) // axis = .vertical; alignment = .trailing
```

Declarative spacing: 

```swift
VerticalStack([ 
    SomeLabel(),

    UIStackViewSpace(12)

    SomeButton()

    UIStackViewSpace(15)

    UIImageView(image: ...)

    SomeView()
    ...
])
```

@ArrangedViewBuilder functionBuilder: 
```swift
HorizontalStack {
    AvatarImageView()    

    UIStackViewSpace(16)

    TopStack { 
        NameLabel()

        if user.isPremium { 
            PremiumMarkerView()
        }

        UIStackViewSpace(8)

        HStackView(tagsViews)
    }

    HorizontalCenterStack { 
        ShareButton()
        DisclosureButton()
    }.spacing(4).distribution(.fillEquality)
}
```


## 🧩 Declarative Constraint Builder
You can set constraints using the same chainable style with anchor constraint. 

The return type of builder will be `AutoLayoutItem` – a simple storage of constants instructions. To build and activate them, just call `activate()` function.

```swift
let myLabel = UILabel()
    .numberOfLines(0) // -> UIView
    ...
    .heightAnchor(0) // -> AutoLayoutItem (same below)
    .topAnchor(16.from(anotherView.topAnchor))
    .leftAnchor(24)
    .rightAnchor(24.orLess.pririty(750))
    .verticalAnchor(backgroundView)
    .activate() // -> UIView (with applyed constraints)
```

### 🧮 Constraint Builder DSL Specification

#### Attributes

- `constant` - Int/Float/CGFloat/...

- target (only relative constraints): 
- - from(target: NSLayoutAnchor) - from the outside of the view.\
    Example: `firstView.rightAnchor(24.from(secondView.leftAnchor))`

- - to(target: NSLayoutAnchor) - from the inside of the view.\
    Example: `subview.leftAnchor(16.to(superview.leftAnchor))`

- - without this attribute builder will apply instruction to superview.\
    Example: `subview.leftAnchor(16)` equivalent to the previous example

- relationType
- - `Equal` (by default)
- - `orLess`\
    Example: `15.orLess`; `15.to(secondView.leftAnchor).orLess`
- - `orGreater`\
    Example: `15.orGreater`; `15.to(secondView.leftAnchor).orGreater`

- priorioty
- - `15.priority(.defaultLow)`
- - or `15.priority(250)`
- - **⚠️ without this attribute builder will apply instruction with priority 999**

- multiplier (only dimension constraints)\
  Example: `headerView.heightAnchor(backgroundView.multiplied(0.5).orLess)`

Final Formula:
```
constant.from|to(_ target: NSLayoutAnchor).priority(NSLayoutPriority).orLess|orGreater
```
The order of the attributes is **arbitrary**:
```swift
15.from(secondView.topAnchor).orLess
20.orLess.to(secondView.bottomAnchor).priority(1000)
8.priority(.required).orGreater
```

Extra anchors: 
- `horizontalAnchor` – leftAnchor + rightAnchor\
  Example: `subview.horizontalAnchor(16)`

- `verticalAnchor` – topAnchor + bottomAnchor\
  Example: `subview.verticalAnchor(16.orLess)`

- `centerAnchor` - centerXAnchor + centerYAnchor\
  Example: `avatarView.centerAnchor(backgroundView)`

- `sizeAnchor` - widthAnchor + heightAnchor\
  Example: `avatarView.sizeAnchor(60)`

- `edgesAnchors(insets: UIEdgeInsets, to target: UIView?, priority: UILayoutPriority)` - combination of the left|top|right|bottom anchors.

- `layout(_ builder: (UIView) -> AutoLayoutItem)` - self-related anchor\
    Example: `myView.layout({ $0.heightAnchor($0.widthAnchor) })`


#### 🧩 View/Builder Composition
```swift
private(set) weak var avatarView: UIImageView!

...

let profileView = UIView()
    .backgroundColor(.gray)
    .heightAnchor(100)
    .add({
        UIImageView()
            .assign(to: &avatarView)
            .contentMode(.scaleAspectFit)
            .sizeAnchor(40)
            .leftAnchor(16)
            .verticalAnchor(0)

        UILabel()
            .numberOfLines(2)
            .rightAnchor(0)
            .leftAnchor(8.from(avatarView.leftAnchor).priority(.required))
    })
    .activate()
```
Or using a convenience initializer
```swift

let profileView = UIView {
    UIImageView()
        .assign(to: &avatarView)
        .contentMode(.scaleAspectFit)
        .sizeAnchor(40)
        .leftAnchor(16)
        .verticalAnchor(0)

    UILabel()
        .numberOfLines(2)
        .rightAnchor(0)
        .leftAnchor(8.from(avatarView.leftAnchor).priority(.required))
}
.backgroundColor(.gray)
.heightAnchor(100)
.activate()
```

**ℹ️ NOTE:**  if you add constraint-builders to a `UIView` (i.e. don't use `anchor-chaining` before call `add(...)`), constraints activations will occur **immediately after adding** in `superview`. In other words, the return type of the `activate()` function will be `Self` (i.e. `UIView`)
```swift
let profileView = UIView()
    .backgroundColor(.gray)
    .add({
        UIImageView()
            .assign(to: &avatarView)
            .contentMode(.scaleAspectFit)
            .sizeAnchor(40)
            .leftAnchor(16)
            .verticalAnchor(0)
        UILabel()
            .numberOfLines(2)
            .rightAnchor(0)
            .leftAnchor(8.from(avatarView.leftAnchor).priority(.required))
    }) // -> UIView (with already added subviews)
    // and you can continue chainable-configuration (for example by specifying own anchors)
    .heightAnchor(100) // -> AutoLayoutItem
    .activate() // -> UIView
```

## How to extend chaining functionality?
First way – write type extension with function that return self:
```swift
extension MyCustomView {
    func myProperty(_ value: ValueType) -> Self {
        self.myProperty = value
        return self
    }
}
```
Second way – using [Sourcery](https://github.com/krzysztofzablocki/Sourcery) apply [Chainable template](https://github.com/Ernest0-Production/DeclarativeLayoutKit/blob/master/Sources/Generator/Chainable.stencil) with your custom view
([see tutorial](https://www.caseyliss.com/2017/3/31/the-magic-of-sourcery)).

## How this framework differs from the others?

There is **huge** number of layout frameworks...\
The **main goal** of creating another one framework was not to create another one framework, but to **make tools for rapid writing of layout code*\
SnapKit, many people know, is one of these solutions, but I decided to make **a more declarative and simple solution**.\
> P.S. in previous versions the Framework was based on DSL SnapKit, but now has its own, more type-safe.

 This `README` decription is all you need to know, no redundant documentation needed.\

### 💉 You can **easily integrate** the framework into project and **combine it with old/existing layout code**.

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
  name: "YOUR_PROJECT_NAME",
  dependencies: [
      .package(url: "https://github.com/Ernest0-Production/DeclarativeLayoutKit.git", from: "3.0.2")
  ],
  targets: [
      .target(name: "YOUR_TARGET_NAME", dependencies: ["DeclarativeLayoutKit"])
  ]
)
```

### Credits

- [Telegram](https://t.me/Ernest0n)


### License

DeclarativeLayoutKit is released under the MIT license. See [LICENSE](https://github.com/Ernest0-Production/DeclarativeLayoutKit/blob/master/LICENSE.md) for details.
