#
# Be sure to run `pod lib lint ADTool.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ADTool'
  s.version          = '1.0.3'
  s.summary          = '广告通用工具'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                        穿山甲广告联盟和Google广告联盟
                       DESC

  s.homepage         = 'https://github.com/Shenbihuyu/AdvertisingCenter'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '小毅' => '2394096095@qq.com' }
  s.source           = { :git => 'https://github.com/Shenbihuyu/AdvertisingCenter.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'ADTool/Classes/**/*'
  
  # s.framework = "CoreMotion"

  # s.vendored_frameworks = 'ADTool/Classes/**/*.framework'

  s.resource_bundles = {
    'ADTool' => ['ADTool/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
 

  s.dependency 'Bytedance-UnionAD'#, '~> 3.3.1.5'
  s.dependency 'Google-Mobile-Ads-SDK'#, '~> 7.55.1'

 
  # s.pod_target_xcconfig  =  {  'OTHER_LDFLAGS'  =>  '-lObjC'  }
  # s.xcconfig = { 
  #   'VALID_ARCHS' => 'arm64 armv7 armv7s', 
  #   'Architectures' => 'arm64  armv7 armv7s', 
  #   'OTHER_LDFLAGS' => '-ObjC'
  # }

  # s.requires_arc = true


end
