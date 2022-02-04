# FlutterUITool

## Android APK 下载地址

`声明1：本项目仅供学习，部分参考别人页面的功能也已标注出原出处，如有侵犯原作者的地方请联系本人进行删除。`


## 本项目包括：

- 首页（Alert、Button、TextField、TabBar、BottomNavigationBar、Sliver、登录模板、侧边栏、我的、个人中心、引导页等）
- 局部（Text、Image等小组件、地址、时间/日期、标签、进度条、侧滑删除、下拉筛选菜单、滚动到指定位置、监听所在位置 ）
- 动画（Animation系列、Tween、Curves、其他、插件-animations ）


## 运行环境

```
[✓] Flutter (Channel stable, 2.8.1, on macOS 12.0.1 21A559 darwin-x64, locale zh-Hans-CN)
[✓] Android toolchain - develop for Android devices (Android SDK version 31.0.0)
[✓] Xcode - develop for iOS and macOS (Xcode 13.1)
[✓] Chrome - develop for the web
[✓] Android Studio (version 2020.3)

```

## 运行截图

### Alert_Dialog 、Button、TextField的封装使用
|![1](https://github.com/dushiling/flutter_ui_tool/blob/main/assets/demonst_img/alert_dialog.jpg)|![2](https://github.com/dushiling/flutter_ui_tool/blob/main/assets/demonst_img/button.jpg)|![3](https://github.com/dushiling/flutter_ui_tool/blob/main/assets/demonst_img/textfield.jpg)|
| :--: | :--: | :--: |
|Alert_Dialog|Button|TextField|



### TabBar
|![1](https://github.com/dushiling/flutter_ui_tool/blob/main/assets/demonst_img/tabbar/top_bar_NoScroll.jpeg)|![2](https://github.com/dushiling/flutter_ui_tool/blob/main/assets/demonst_img/tabbar/top_bar_Scroll.jpeg)|![3](https://github.com/dushiling/flutter_ui_tool/blob/main/assets/demonst_img/tabbar/top_bar_Height44.jpeg)|
| :--: | :--: | :--: | 
|top_bar_NoScroll|top_bar_Scroll|top_bar_Height44|
|![1](https://github.com/dushiling/flutter_ui_tool/blob/main/assets/demonst_img/tabbar/sliver_tab_NoScroll.jpeg)|![2](https://github.com/dushiling/flutter_ui_tool/blob/main/assets/demonst_img/tabbar/sliver_tab_Scroll.jpeg)|![3](https://github.com/dushiling/flutter_ui_tool/blob/main/assets/demonst_img/tabbar/sliver_tab_Extent.jpeg)
|sliver_tab_NoScroll|sliver_tab_Scroll|sliver_tab_Extent|


### BottomNavigationBar
|![1](https://github.com/dushiling/flutter_ui_tool/blob/main/assets/demonst_img/bottomNavigationBar/general.jpg)|![2](https://github.com/dushiling/flutter_ui_tool/blob/main/assets/demonst_img/bottomNavigationBar/bottom_line.jpg)|![3](https://github.com/dushiling/flutter_ui_tool/blob/main/assets/demonst_img/bottomNavigationBar/change_color.jpg)|![4](https://github.com/dushiling/flutter_ui_tool/blob/main/assets/demonst_img/bottomNavigationBar/bubble_bar.jpg)|
| :--: | :--: | :--: | :--: |
|常规|底部线条|奇幻变色|气泡bar|
|![1](https://github.com/dushiling/flutter_ui_tool/blob/main/assets/demonst_img/bottomNavigationBar/top_line.jpg)|![2](https://github.com/dushiling/flutter_ui_tool/blob/main/assets/demonst_img/bottomNavigationBar/ios_style.jpg)|![3](https://github.com/dushiling/flutter_ui_tool/blob/main/assets/demonst_img/bottomNavigationBar/float_button.jpg)|![4](https://github.com/dushiling/flutter_ui_tool/blob/main/assets/demonst_img/bottomNavigationBar/round.jpg)|
|顶部线条|ios风格|浮动按钮|圆形突出|
|![1](https://github.com/dushiling/flutter_ui_tool/blob/main/assets/demonst_img/bottomNavigationBar/curve.jpg)|![2](https://github.com/dushiling/flutter_ui_tool/blob/main/assets/demonst_img/bottomNavigationBar/convex.jpg)|![3](https://github.com/dushiling/flutter_ui_tool/blob/main/assets/demonst_img/bottomNavigationBar/convex2.jpg)|![4](https://github.com/dushiling/flutter_ui_tool/blob/main/assets/demonst_img/bottomNavigationBar/concave.jpg)|
|曲线|凸起弧度1|凸起弧度2||凹入