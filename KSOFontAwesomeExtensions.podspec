#
# Be sure to run `pod lib lint ${POD_NAME}.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KSOFontAwesomeExtensions'
  s.version          = '0.12.1'
  s.summary          = 'A collection of categories on NSString, UIFont/NSFont and UIImage/NSImage to make creation of images using the Font Awesome font easier.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A collection of categories on `NSString`, `UIFont`, `NSFont`, `NSImage`, and `UIImage` to make creation of images using the Font Awesome font easier. Support is provided for iOS/macOS/tvOS/watchOS.
                       DESC

  s.homepage         = 'https://github.com/Kosoku/KSOFontAwesomeExtensions'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'BSD', :file => 'license.txt' }
  s.author           = { 'William Towe' => 'willbur1984@gmail.com' }
  s.source           = { :git => 'https://github.com/Kosoku/KSOFontAwesomeExtensions.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.12'
  s.tvos.deployment_target = '10.0'
  s.watchos.deployment_target = '3.0'
  
  s.requires_arc = true

  s.source_files = 'KSOFontAwesomeExtensions/**/*.{h,m}'
  s.exclude_files = 'KSOFontAwesomeExtensions/KSOFontAwesomeExtensions-Info.h'
  s.private_header_files = 'KSOFontAwesomeExtensions/Private/*.h'
  s.ios.exclude_files = 'KSOFontAwesomeExtensions/macOS'
  s.osx.exclude_files = 'KSOFontAwesomeExtensions/iOS'
  s.tvos.exclude_files = 'KSOFontAwesomeExtensions/macOS'
  s.watchos.exclude_files = 'KSOFontAwesomeExtensions/macOS', 'KSOFontAwesomeExtensions/iOS/UIButton+KSOFontAwesomeExtensions.{h,m}'
  
  s.ios.resource_bundles = {
    'KSOFontAwesomeExtensions' => ['KSOFontAwesomeExtensions/FontAwesome.ttf']
  }
  s.osx.resource_bundles = {
    'KSOFontAwesomeExtensions' => ['KSOFontAwesomeExtensions/FontAwesome.ttf']
  }
  s.tvos.resource_bundles = {
    'KSOFontAwesomeExtensions' => ['KSOFontAwesomeExtensions/FontAwesome.ttf']
  }

  s.ios.frameworks = 'Foundation', 'UIKit'
  s.tvos.frameworks = 'Foundation', 'UIKit'
  s.watchos.frameworks = 'Foundation', 'UIKit'
  s.osx.frameworks = 'Foundation', 'AppKit'
  
  s.dependency 'Stanley'
end
