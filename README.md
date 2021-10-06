[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fjathu%2FUIImageColors%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/jathu/UIImageColors)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fjathu%2FUIImageColors%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/jathu/UIImageColors)

# UIImageColors

iTunes style color fetcher for `UIImage` and `NSImage`. It fetches the most dominant and prominent colors.

![preview](preview.png)

## Installation

### Manual

Copy the [Sources-folder](Sources/) into your project.

### [Cocoapods](https://cocoapods.org)

Add UIImageColors to your [`Podfile`](https://cocoapods.org/pods/UIImageColors):

```
pod 'UIImageColors'
```

### [Carthage](https://github.com/Carthage/Carthage)

Add UIImageColors to your `Cartfile`:

```
github "jathu/UIImageColors"
```

## Example

Asynchronous example:

```swift
let image = UIImage(named: "yeezus.png")

image.getColors { colors in
    backgroundView.backgroundColor = colors.background
    mainLabel.textColor = colors.primary
    secondaryLabel.textColor = colors.secondary
    detailLabel.textColor = colors.detail
}

if #available(iOS 15.0) {
    let colors = await image.colors()
}
```

Synchronous example:

```swift
let colors = UIImage(named: "yeezus.png").getColors()

backgroundView.backgroundColor = colors.background
mainLabel.textColor = colors.primary
secondaryLabel.textColor = colors.secondary
detailLabel.textColor = colors.detail
```

## UIImage/NSImage Instance Methods

```swift
getColors() -> UIImageColors?
getColors(quality: ImageColorsQuality) -> UIImageColors?
getColors(_ completion: (UIImageColors?) -> Void) -> Void
getColors(quality: UIImageColorsQuality, _ completion: (UIImageColors?) -> Void) -> Void
```

## UIImageColors Objects

`UIImageColors` is struct that contains four different `UIColor` (or `NSColor` on macOS) variables.

```swift
public struct UIImageColors {
    public var background: UIColor!
    public var primary: UIColor!
    public var secondary: UIColor!
    public var detail: UIColor!
}
```

`UIImageColorsQuality` is a enum with four different qualities. The qualities refer to how much the original image is scaled down. `Lowest` implies smaller size and faster performance at the cost of quality colors. `High` implies larger size with slower performance with good colors. `Highest` implies no downscaling and very good colors, but it is very slow.

The default is set to `high`.

```swift
public enum UIImageColorsQuality: CGFloat {
    case lowest = 50 // 50px
    case low = 100 // 100px
    case high = 250 // 250px
    case highest = 0 // No scale
}
```

## License

The [license](https://github.com/jathu/UIImageColors/blob/master/LICENSE) is provided in the project folder. This is based on Panic's [OS X ColorArt](https://github.com/panicinc/ColorArt/#license).

------
June 2015 - Toronto
