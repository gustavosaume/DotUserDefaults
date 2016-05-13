#
# Be sure to run `pod lib lint DotUserDefaults.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "DotUserDefaults"
  s.version          = "0.1.0"
  s.summary          = "Access and store NSUserDefaults with Enums"
  s.description      = <<-DESC
    .UserDefaults has two main functions. It will let you access NSUserDefaults
    using string type Enums, so you don't have to type .rawValue every time you
    want to use Enums as the keys of your NSUserDefaults. Also, this extension
    adds methods that will let you easily store RawRepresentable Enums in the NSUserDefaults.
                       DESC

  s.homepage         = "https://github.com/gustavosaume/DotUserDefaults"
  s.license          = 'MIT'
  s.author           = { "Gustavo Saume" => "gustavosaume@gmail.com" }
  s.source           = { :git => "https://github.com/gustavosaume/DotUserDefaults.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/withbreakpoints'

  s.ios.deployment_target = '8.0'

  s.source_files = 'DotUserDefaults/Classes/**/*'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
