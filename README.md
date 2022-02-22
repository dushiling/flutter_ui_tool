# FlutterUITool


`声明1：本项目仅供学习，部分参考别人页面的功能也已标注出原出处，如有侵犯原作者的地方请联系本人添加标注或删除。`


## 本项目包括：

- 首页（Alert、Button、TextField、TabBar、BottomNavigationBar、Sliver、登录模板、侧边栏、我的、个人中心、引导页）
- 局部（Text、Image等小组件、地址、时间/日期、标签、进度条、侧滑删除、下拉筛选菜单、滚动到指定位置、监听所在位置 ）
- 动画（Animation系列、Tween、Curves、其他、插件-animations ）
- 项目中用到的封装的工具类（size_util、tost_util、platform_utils、log_utils、color_util、style_util、theme_util等 ）
- 夜间模式、多语言


## 运行环境
`提示：null-safe环境`
```
[✓] Flutter (Channel stable, 2.8.1, on macOS 12.0.1 21A559 darwin-x64, locale zh-Hans-CN)
[✓] Android toolchain - develop for Android devices (Android SDK version 31.0.0)
[✓] Xcode - develop for iOS and macOS (Xcode 13.1)
[✓] Chrome - develop for the web
[✓] Android Studio (version 2020.3)

```

## 运行截图

### Button、TextField、Alert_Dialog 的封装使用
|![1](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/other/button.jpg)|![2](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/other/textfield.jpg)|![3](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/other/alert_dialog.jpg)|
| :--: | :--: | :--: |
|Button|TextField|Alert_Dialog|



### TabBar
|![1](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/Tabbar/top_bar_NoScroll.jpeg)|![2](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/Tabbar/top_bar_Scroll.jpeg)|![3](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/Tabbar/top_bar_Height44.jpeg)|
| :--: | :--: | :--: | 
|top_bar_NoScroll|top_bar_Scroll|top_bar_Height44|



### BottomNavigationBar
|![1](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/bottomNavigationBar/general.jpg)|![2](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/bottomNavigationBar/bottom_line.jpg)|![3](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/bottomNavigationBar/change_color.gif)|![4](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/bottomNavigationBar/ios_style.jpg)|
| :--: | :--: | :--: | :--: |
|常规|底部线条|切换变色|ios风格|
|![1](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/bottomNavigationBar/top_line.gif)|![2](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/bottomNavigationBar/bubble_bar.gif)|![3](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/bottomNavigationBar/float_button.jpg)|![4](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/bottomNavigationBar/round.gif)|
|顶部线条|气泡bar|按钮固定中间|圆形突出|
|![1](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/bottomNavigationBar/curve.gif)|![2](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/bottomNavigationBar/convex.gif)|![3](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/bottomNavigationBar/convex2.jpg)|![4](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/bottomNavigationBar/concave.gif)|
|曲线|凸起弧度1|凸起弧度2|凹入|


### Sliver
|![1](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/sliver/family_widget.jpg)|![2](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/sliver/sliverAppBar_tab.gif)|![3](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/sliver/sliver_nestedScrollview.gif)|![4](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/sliver/combination.jpg)|
| :--: | :--: | :--: | :--: |
|家族控件|SliverAppBar+tab|sliver+nestedScroll|组合测试|


### 登录模板
|![1](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/login/ordinary_1.jpg)|![2](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/login/ordinary_2.jpg)|![3](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/login/ordinary_3.jpg)|![4](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/login/ordinary_4.jpg)|
| :--: | :--: | :--: | :--: |
|常规-登录|常规-注册|常规-快速登录|常规-忘记密码|
|![1](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/login/top_bottom.gif)|![2](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/login/overturn.gif)|![3](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/login/present.jpg)|![4](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/login/bottomSheet.gif)|
|上下交替|前后翻转|present跳转|BottomSheet弹出|
|![1](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/login/phone.jpg)|![2](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/login/expression.jpg)|![3](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/login/verificod.jpg)|![4](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/login/login_video_demo.gif)|
|手机号登录|表情动效|验证码登录|视频背景登录|


### 侧边栏
|![1](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/sidebar/left_inner.jpg)|![2](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/sidebar/left_out.jpg)|![3](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/sidebar/left_out_radian.jpg)|![4](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/sidebar/right_out.jpg)|
| :--: | :--: | :--: | :--: |
|左边-内部|左边-外部|左边-弧度|右边-外部|

### 我的
|![1](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/mine/appbar_gradient.jpg)|![2](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/mine/card.jpg)|
| :--: | :--: |
|导航栏渐变|卡片|


### 个人中心
|![1](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/person_center/person1.jpg)|![2](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/person_center/person2.jpg)|![3](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/person_center/person3.jpg)|
| :--: | :--: | :--: |
|顶部弧度|个人详情模式1|个人详情模式2|

### 引导页
|![1](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/guidance/g1.jpg)|![2](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/guidance/g2.jpg)|![3](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/guidance/g3.gif)|
| :--: | :--: | :--: |
|本地图片|网络图片|动画式|



### Widgets
|![1](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/widgets/text.jpg)|![2](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/widgets/image.jpg)|![3](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/widgets/toggleButtom.jpg)|![4](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/widgets/chack_switch.jpg)|
| :--: | :--: | :--: | :--: |
|文字|图片|ToggleButton|Check-Switch|

### 地址
|![1](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/address/picker.jpg)|![2](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/address/city.jpg)|![3](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/address/country.jpg)|
| :--: | :--: | :--: |
|picker|城市|国家|


### 时间
|![1](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/time/picker.jpg)|![2](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/time/round_select.jpg)|![3](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/time/clock.jpg)|![4](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/time/alarm_clock.jpg)|
| :--: | :--: | :--: | :--: |
|picker选择|时钟选择|绘制实时钟表|绘制实时闹钟|


### 标签
|![1](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/tag/chip.jpg)|![2](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/tag/hot.jpg)|![3](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/tag/drag.jpg)|
| :--: | :--: | :--: |
|Chip|热门|添加删除|

### 进度条
|![1](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/progressbar/one-way.jpg)|![2](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/progressbar/two-way.jpg)|![3](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/progressbar/no-way.jpg)|
| :--: | :--: | :--: |
|单向|双向|无节点|


### 侧滑删除
|![1](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/sideslip_delete/one_deleate.jpg)|![2](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/sideslip_delete/two_deleate.jpg)|
| :--: | :--: |
|单向侧滑|双向侧滑|

### 下拉筛选菜单
|![1](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/dropDown_menu/one_select.jpg)|![2](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/dropDown_menu/mult_select.jpg)|
| :--: | :--: |
|仿美团|多选|


### 滚动到指定位置、监听所在位置
|![1](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/scroll_position/sp1.jpg)|![2](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/scroll_position/sp2.jpg)|![3](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/monitor_position/mp1.jpg)|![4](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/monitor_position/mp2.jpg)|
| :--: | :--: | :--: | :--: |
|滚动到指定位置1|滚动到指定位置2|监听所在位置1|监听所在位置2|


### 动画
|![1](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/animation/animation.gif)|![2](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/animation/curves.gif)|![3](https://github.com/dushiling/project_image/blob/main/flutter_ui_tool/animation/transition.gif)|
| :--: | :--: | :--: |
|Tween+Animation|Curvers|路由过渡动画Transition|


## 特别鸣谢
- [shichulei/flutter_app](https://github.com/shichunlei/flutter_app)
- [mitesh77/Best-Flutter-UI-Templates](https://github.com/mitesh77/Best-Flutter-UI-Templates)
- [CarGuo/gsy_flutter_demo](https://github.com/CarGuo/gsy_flutter_demo)
- [kingsic/flutterkit](https://github.com/kingsic/flutterkit)
