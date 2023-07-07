#
# Be sure to run `pod lib lint Polaris.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Polaris'
  s.version          = '0.0.1'
  s.summary          = 'A short description of Polaris.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Polaris-Labs/Polaris'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Choshim.Wei' => 'choshim@sidus.link' }
  s.source           = { :git => 'https://github.com/Polaris-Labs/Polaris.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'
  s.swift_version = '5.8'
  
  s.default_subspec = 'Core'
  
  s.subspec 'Core' do |core|
    core.source_files = 'Polaris/Classes/Core/**/*'
    
    core.dependency 'Polaris/Defaultable'
    core.dependency 'Moya', "~> 15.0.0"
  end
  
  s.subspec 'Defaultable' do |ss|
    ss.source_files = 'Polaris/Classes/Defaultable/**/*'
  end
  
end
