# ADTool

[![CI Status](https://img.shields.io/travis/Simon/ADTool.svg?style=flat)](https://travis-ci.org/Simon/ADTool)
[![Version](https://img.shields.io/cocoapods/v/ADTool.svg?style=flat)](https://cocoapods.org/pods/ADTool)
[![License](https://img.shields.io/cocoapods/l/ADTool.svg?style=flat)](https://cocoapods.org/pods/ADTool)
[![Platform](https://img.shields.io/cocoapods/p/ADTool.svg?style=flat)](https://cocoapods.org/pods/ADTool)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

ADTool is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby

#  use_frameworks!   # 要把 use_frameworks! 这句注释了

# pod 'ADTool'
pod 'ADTool', :git => 'https://github.com/Shenbihuyu/AdvertisingCenter.git'

```


## Using

## Info.plist 配置
 - 允许 http 网络方式请求设置,添加
    `App Transport Security Settings` 类型为 `Array`  -->  `Allow Arbitrary Loads` 值为 `YES`
 
 - 添加 Google广告的 APPID 
    `GADApplicationIdentifier`  类型为 `String`, 值为 Google广告的 APPID 
    
    ![](https://tva1.sinaimg.cn/large/0081Kckwly1glhl1xscduj30c104sgm3.jpg)
 
 ## 添加广告配置参数文件
 新建参数配置文件 : ` AdvertisingConf.plist `,  配置参数如下:
    
```
<plist version="1.0">
<dict>
    <!-- Google 广告 -->
    <key>Admob</key>
    <dict>
        <!-- appID -->
        <key>appID</key>
        <string>xxx</string>
        <!-- bannerID -->
        <key>bannerID</key>
        <string>xxx</string>
        <!-- 插屏广告 -->
        <key>interstitialID</key>
        <string>xxx</string>
        <!-- 激励视频 -->
        <key>rewardedVideoID</key>
        <string>xxx</string>
    </dict>
    
    <!-- 穿山甲广告 -->
    <key>BUAd</key>
    <dict>
        <!-- 全屏 -->
        <key>fullscreenAdID</key>
        <string>xxx</string>
        <!-- appID -->
        <key>appID</key>
        <string>xxx</string>
        <!-- bannerID -->
        <key>bannerID</key>
        <string>xxx</string>
        <!-- 插屏广告 -->
        <key>interstitialID</key>
        <string>xxx</string>
        <!-- 激励视频 -->
        <key>rewardedVideoID</key>
        <string>xxx</string>
        <!-- 开屏 -->
        <key>splashAdID</key>
        <string>xxx</string>
    </dict>
    
</dict>
</plist>

```
 

 


## Author

Simon, 2394096095@qq.com

## License

ADTool is available under the MIT license. See the LICENSE file for more info.
