#
# Be sure to run `pod lib lint YJToolsKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YJToolsKit'
  s.version          = '1.0.8'
  s.summary          = '常用工具和分类第三方的一个合集'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = '常用工具和分类第三方的一个合集,作为一个基础库使用'

  s.homepage         = 'https://github.com/full-of-fire/YJToolsKit.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'full-of-fire' => '591730822@qq.com' }
  s.source           = { :git => 'https://github.com/full-of-fire/YJToolsKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'YJToolsKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'YJToolsKit' => ['YJToolsKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'MapKit','CoreLocation','CoreGraphics'
  s.dependency 'SVProgressHUD'
  s.dependency 'SDWebImage'
  s.dependency 'MJExtension'
  s.dependency 'IQKeyboardManager'
end
