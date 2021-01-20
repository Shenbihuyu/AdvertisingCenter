*ADTool*

[TOC]

# 使用

- 使用方法

```ruby
#  use_frameworks!   # 要把 use_frameworks! 这句注释了

pod 'ADTool', :git => 'https://github.com/Shenbihuyu/AdvertisingCenter.git'

```

- 假如报了下面两个错误,可以在顶部加上这一句

```ruby
# 解决因为 cocoapods 库引起的 Assets.xcassets报错和 script phase “[CP] Copy Pods Resources” 冲突
install! 'cocoapods', :disable_input_output_paths => true
```



# Info.plist 配置
-  允许 http 网络方式请求设置,添加
  `App Transport Security Settings` 类型为 `Array`  -->  `Allow Arbitrary Loads` 值为 `YES`

```ruby
<key>NSAppTransportSecurity</key>
	<dict>
		<key>NSAllowsArbitraryLoads</key>
		<true/>
	</dict>
```



- 一个字符串值为您的 AdMob 应用 ID 的 `GADApplicationIdentifier` 键（[在 AdMob 界面中标识](https://support.google.com/admob/answer/7356431)）。

```ruby
<key>GADApplicationIdentifier</key>
<string>ca-app-pub-3940256099942544~1458002511</string>
```



- 设置 SKAdNetworkItems ，获得应用安装的归因结果 。

SKAdNetwork（SKAN）是 Apple 的归因解决方案，可帮助广告客户在保持用户隐私的同时衡量广告活动。 使用 Apple 的 SKAdNetwork 后，即使 IDFA 不可用，广告网络也可以正确获得应用安装的归因结果。 访问 https://developer.apple.com/documentation/storekit/skadnetwork 了解更多信息。

```ruby
<key>SKAdNetworkItems</key>
  <array>
  <!-- 这个是谷歌的 -->
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>cstr6suwn9.skadnetwork</string>
    </dict>
  <!--  这个是穿山甲的 -->
  	<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>238da6jt44.skadnetwork</string>
		</dict>
  <!--  这个是穿山甲的 -->
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>22mmun2rn5.skadnetwork</string>
		</dict>
  </array>
```



-  请求应用跟踪透明度授权

App Tracking Transparency（ATT）适用于请求用户授权，访问与应用相关的数据以跟踪用户或设备。 访问 https://developer.apple.com/documentation/apptrackingtransparency了解更多信息。

**苹果未要求开发者配置之前，开发者请勿配置ATT，当前阶段配置后会影响idfa 的获取，从而影响收益。**

1. 支持苹果 ATT：从 iOS 14 开始，若开发者设置 App Tracking Transparency 向用户申请跟踪授权，在用户授权之前IDFA 将不可用。 如果用户拒绝此请求，应用获取到的 IDFA 将自动清零，可能会导致您的广告收入的降低
2. 要获取 App Tracking Transparency 权限，请更新您的 Info.plist，添加 NSUserTrackingUsageDescription 字段和自定义文案描述。代码示例：

```ruby
 <key>NSUserTrackingUsageDescription</key>
    <string>需要获取您设备的广告标识符，以为您提供更好的广告体验</string>
```

如需显示授权请求，请调用 [`requestTrackingAuthorizationWithCompletionHandler:`](https://developer.apple.com/documentation/apptrackingtransparency/attrackingmanager/3547037-requesttrackingauthorization)。我们建议您先等待回调完成，再加载广告，这样如果用户授予应用跟踪透明度权限，我们建议您申请权限后在请求广告，以便获得SDK准确获得用户的授权 (建议您在应用启动时调用 apple 提供的 AppTrackingTransparency 方案，获取用户的 IDFA 授权，以便穿山甲提供更精准的广告投放和收入优化)。示例：

```swift 
import AppTrackingTransparency
import AdSupport
func requestIDFA() {
  ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
    // Tracking authorization completed. Start loading ads here.
    // loadAd()
  })
}
```



![](https://tva1.sinaimg.cn/large/008eGmZEgy1gmu0t2yblnj30go05nmxw.jpg)





 ## 谷歌广告配置

 - 添加 Google广告的 APPID 
    `GADApplicationIdentifier`  类型为 `String`, 值为 Google广告的 APPID 
    
    ![](https://tva1.sinaimg.cn/large/0081Kckwly1glhl1xscduj30c104sgm3.jpg)
    
```
<key>GADApplicationIdentifier</key>
<string>ca-app-pub-3940256099942544~1458002511</string>
<key>SKAdNetworkItems</key>
      <array>
        <dict>
          <key>SKAdNetworkIdentifier</key>
          <string>cstr6suwn9.skadnetwork</string>
        </dict>
      </array>
    <key>NSUserTrackingUsageDescription</key>
    <string>需要获取您设备的广告标识符，以为您提供更好的广告体验</string>

```





## 穿山甲广告配置





# 平台账号广告代码位ID统一配置

 在项目中新建参数配置文件 : ` AdvertisingConf.plist `,  配置参数如下:

```
<plist version="1.0">
<dict>
    <!-- Google 广告 （sdk测试账号，请修改） -->
    <key>Admob</key>
    <dict>
        <!-- appID -->
        <key>appID</key>
        <string>ca-app-pub-3940256099942544~1458002511</string>
        <!-- bannerID -->
        <key>bannerID</key>
        <string>ca-app-pub-3940256099942544/2934735716</string>
        <!-- 插屏广告 -->
        <key>interstitialID</key>
        <string>ca-app-pub-3940256099942544/5135589807</string>
        <!-- 激励视频 -->
        <key>rewardedVideoID</key>
        <string>ca-app-pub-3940256099942544/1712485313</string>
        <!-- 开屏 -->
        <key>splashAdID</key>
        <string>ca-app-pub-3940256099942544/5662855259</string>
    </dict>
    
    <!-- 穿山甲广告 （sdk测试账号，请修改） -->
    <key>BUAd</key>
    <dict>
     		<!-- appID -->
        <key>appID</key>
        <string>5000546</string>
        <!-- 全屏 -->
        <key>fullscreenAdID</key>
        <string>900546299</string>
        <!-- bannerID -->
        <key>bannerID</key>
        <string>900546859</string>
        <!-- 插屏广告 -->
        <key>interstitialID</key>
        <string>900546957</string>
        <!-- 激励视频 -->
        <key>rewardedVideoID</key>
        <string>900546826</string>
        <!-- 开屏 -->
        <key>splashAdID</key>
        <string>800546808</string>
    </dict>
    
</dict>
</plist>

```





