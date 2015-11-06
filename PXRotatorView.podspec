#
# Be sure to run `pod lib lint PXRotatorView.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "PXRotatorView"
  s.version          = "0.5.7"
  s.summary          = "An auto rotating carousel view based on iCarousel and ReactiveCocoa"
  s.description      = <<-DESC
                        An carousel view based on iCarousel and ReactiveCocoa.
                        You should override base view model and provide your own data source.
                        It's easy to  customize a page control using category.
                       DESC
  s.homepage         = "https://github.com/drinking/PXRotatorView"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "drinking" => "pan49@126.com" }
  s.source           = { :git => "https://github.com/drinking/PXRotatorView.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'PXRotatorView' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'iCarousel', '~> 1.8.1'

end
