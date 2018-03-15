## KSOFontAwesomeExtensions

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Version](http://img.shields.io/cocoapods/v/KSOFontAwesomeExtensions.svg)](http://cocoapods.org/?q=KSOFontAwesomeExtensions)
[![Platform](http://img.shields.io/cocoapods/p/KSOFontAwesomeExtensions.svg)]()
[![License](http://img.shields.io/cocoapods/l/KSOFontAwesomeExtensions.svg)](https://github.com/Kosoku/KSOFontAwesomeExtensions/blob/master/license.txt)

A collection of categories on `NSString`, `UIFont`, `NSFont`, `NSImage` and `UIImage` to make creation of images using the Font Awesome font easier.

### Installation

You can install *KSOFontAwesomeExtensions* using [cocoapods](https://cocoapods.org/), [Carthage](https://github.com/Carthage/Carthage), or as a framework. When installing as a framework, ensure you also link to [Stanley](https://github.com/Kosoku/Stanley) as *KSOFontAwesomeExtensions* relies on it. 

The three free Font Awesome fonts are bundled as part of the framework so you do not have to bundle it as part of you app. However, if you are using the framework on watchOS, the fonts must be included as part of the watchOS app bundle and included in the *Info.plist* using the `UIAppFonts` key for both the extension and bundle.

### Dependencies

Third party:

- [Stanley](https://github.com/Kosoku/Stanley)