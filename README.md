# DotUserDefaults

[![CI Status](http://img.shields.io/travis/gustavosaume/DotUserDefaults.svg?style=flat)](https://travis-ci.org/gustavosaume/DotUserDefaults)
[![Version](https://img.shields.io/cocoapods/v/DotUserDefaults.svg?style=flat)](http://cocoapods.org/pods/DotUserDefaults)
[![License](https://img.shields.io/cocoapods/l/DotUserDefaults.svg?style=flat)](http://cocoapods.org/pods/DotUserDefaults)
[![Platform](https://img.shields.io/cocoapods/p/DotUserDefaults.svg?style=flat)](http://cocoapods.org/pods/DotUserDefaults)

NSUserDefaults + Enums = 🙌

.UserDefaults has two main functions. It will let you access NSUserDefaults 
using string type Enums, so you don't have to type .rawValue every time you 
want to use Enums as the keys of your NSUserDefaults. Also, this extension adds 
methods that will let you easily store RawRepresentable Enums in the 
NSUserDefaults.

# Usage

```swift
import DotUserDefaults
```

## Enums as NSUserDefaults keys

Normally you would define constants to access your user default values or, if 
you like to live dangerously, type in the string directly. Now, you can safely
access _NSUserDefaults_ via _Enums_ without having to use _rawValue_ all the time.
 
```swift
enum MyDefaults: String {
  case WelcomeText = "welcomeText"
}

func viewDidLoad() {
  super.viewDidLoad()
  welcomeLabel.text = NSUserDefaults.standardUserDefaults().stringForKey(MyDefaults.WelcomeText)
}

func updateWelcomeText(text: String) {
  NSUserDefaults.standardUserDefaults().setObject(text, forKey: MyDefaults.WelcomeText)
}
```

## Storing Enums in NSUserDefaults

Out of the box, you can only store Objects in _NSUserDefaults_ unless you're brave
enough to use NSData to do the convertion. This convenience extension allows you to
"store" and access enums without the need of much convertion. It's limited only 
to _RawRepresentable_ enums of the type String, Int, Float, Double. 


```swift

enum MyDefaults: String {
  case WelcomeText = "welcomeText"
}

enum WelcomeText: String {
  case Hai = "👋"
  case Cheers = "🍻"
  case Cool = "👌"
}

func viewDidLoad() {
  super.viewDidLoad()
  welcomeText = NSUserDefaults.standardUserDefaults().stringForKey(MyDefaults.WelcomeText)
}

func updateWelcomeText(text: WelcomeText) {
  NSUserDefaults.standardUserDefaults().setObject(text, forKey: MyDefaults.WelcomeText)
}

```

# Instalation
## Carthage
To integrate DotUserDefaults into your project using Carthage, add to your Cartfile:

github "gustavosaume/DotUserDefaults" ~> 0.1
Run carthage update to build the framework and drag the built DotUseDefaults.framework into your Xcode project. See more instructions on the [Carthage page](https://github.com/Carthage/Carthage).

## Cocoapods

DotUserDefaults is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "DotUserDefaults"
```

## Author

Gustavo Saume, gustavosaume@gmail.com

## License

DotUserDefaults is available under the MIT license. See the LICENSE file for more info.
