import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'child/conves_child/components/chip_item.dart';
import 'child/conves_child/components/choose_tab_item.dart';
import 'child/conves_child/components/colors_item.dart';
import 'child/conves_child/components/gradient_item.dart';
import 'child/conves_child/components/heading.dart';
import 'child/conves_child/components/radio_item.dart';
import 'child/conves_child/custom_appbar_sample.dart';
import 'child/conves_child/data.dart';
import 'child/conves_child/model/badge.dart';
import 'child/conves_child/model/choice_value.dart';
class ConvexBottombar extends StatefulWidget {
  const ConvexBottombar({Key? key}) : super(key: key);

  @override
  _ConvexBottombarState createState() => _ConvexBottombarState();
}

class _ConvexBottombarState extends State<ConvexBottombar> with SingleTickerProviderStateMixin{
  static const kStyles = [
    ChoiceValue<TabStyle>(
      title: 'TabStyle.react',
      label: 'Appbar use react style',
      value: TabStyle.react,
    ),
    ChoiceValue<TabStyle>(
      title: 'TabStyle.reactCircle',
      label: 'Appbar use reactCircle style',
      value: TabStyle.reactCircle,
    ),
    ChoiceValue<TabStyle>(
      title: kIsWeb
          ? 'TabStyle.flip (Flutter Web is not supported)'
          : 'TabStyle.flip',
      label: 'Appbar use flip style',
      value: TabStyle.flip,
    ),
    ChoiceValue<TabStyle>(
      title: 'TabStyle.textIn',
      label: 'Appbar use textIn style',
      value: TabStyle.textIn,
    ),
    ChoiceValue<TabStyle>(
      title: 'TabStyle.titled',
      label: 'Appbar use titled style',
      value: TabStyle.titled,
    ),
    ChoiceValue<TabStyle>(
      title: 'TabStyle.fixed',
      label: 'Appbar use fixed style',
      value: TabStyle.fixed,
    ),
    ChoiceValue<TabStyle>(
      title: 'TabStyle.fixedCircle',
      label: 'Appbar use fixedCircle style',
      value: TabStyle.fixedCircle,
    ),
  ];

  static final kTabTypes = [
    ChoiceValue<List<TabItem>>(
      title: 'Icon Tab',
      label: 'Appbar use icon with Tab',
      value: Data.items(image: false),
    ),
    ChoiceValue<List<TabItem>>(
      title: 'Image Tab',
      label: 'Appbar use image with Tab',
      value: Data.items(image: true),
    ),
  ];

  var _tabItems = kTabTypes.first;

  Color _barColor = Data.namedColors.first.color;
  Gradient? _gradient = Data.gradients.first;
  ChoiceValue<TabStyle> _style = kStyles.first;
  ChoiceValue<Curve> _curve = Data.curves.first;
   Badge? _badge= Data.badges.first;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length:  _tabItems.value.length, vsync: this);
  }


  @override
  Widget build(BuildContext context) {

    var options = <Widget>[
      //BgColor背景色
      const Heading('Appbar Color'),
      ColorsItem(Data.namedColors, _barColor, _onBarColorChanged),
      //Gradient渐变色
      const Heading('Background Gradient'),
      GradientItem(Data.gradients, _gradient, _onGradientChanged),
      //Badge角标
      const Heading('Badge Chip'),
      ChipItem(Data.badges, _badge, _onBadgeChanged),
      //Type类型
      const Heading('Tab Type'),
      ChooseTabItem(kTabTypes, _tabItems, _onTabItemTypeChanged),
      const Heading('Tab Style'),
    ];
      //Style动画风格
    options.addAll(kStyles.map((s) => RadioItem<TabStyle>(s, _style,
         _onStyleChanged)));

    if (_style.value != TabStyle.fixed &&
        _style.value != TabStyle.fixedCircle) {
      //Curve曲线
      options.add(const Heading('Animation Curve'));
      options.addAll(
          Data.curves.map((c) => RadioItem<Curve>(c, _curve, _onCurveChanged)));
    }




    return Scaffold(
        appBar: AppBar(title: Text('convexBottom'),
          backgroundColor: _barColor,
        actions: [
          IconButton(
            icon: Icon(Icons.style),
            color: Colors.white,
            tooltip: "Custom style example",
            onPressed: () => Get.to(CustomAppBarDemo()),
          ),
        ],
        ),
        body: TabBarView(
            controller: _tabController,
            children: _tabItems.value
                .map((i) => i.title == 'Home'|| i.title =='Happy'
                ? ListView(children: options)
                : Center(
                child: Text(
                  '${i.title} World',
                  style: TextStyle(fontSize: 30),
                )))
                .toList(growable: false)),
       bottomNavigationBar: _badge == null
           ?ConvexAppBar(
         items:_tabItems.value,//true
         style: _style.value,//reactCircle flip textIn titled fixed fixedCircle
         curve:_curve.value,//easeIn fastOutSlowIn
         backgroundColor: _barColor,//Color(0xFFf44336) Color(0xFF673AB7)
         gradient: _gradient,//1、2、3
         controller: _tabController,
         initialActiveIndex: 2,
         onTap: (int i) => debugPrint('select index=$i'),
       ):ConvexAppBar.badge(
         { 2: Colors.redAccent, 3: _badge!.text, 4: Icons.assistant_photo,},
         badgePadding: _badge!.padding,
         badgeColor: _badge!.badgeColor,
         badgeBorderRadius: _badge!.borderRadius,
         badgeMargin: EdgeInsets.only(bottom: 20, left: 30),
         items: _tabItems.value,
         style: _style.value,
         curve: _curve.value,
         backgroundColor: _barColor,
         gradient: _gradient,
         controller: _tabController,
         initialActiveIndex: 2,
         onTap: (int i) => debugPrint('select index=$i'),
       ),
    );
  }


  void _onTabItemTypeChanged(ChoiceValue<List<TabItem>> value) {
    setState(() {
      _tabItems = value;
    });
  }

  void _onStyleChanged(ChoiceValue<TabStyle> value) {
    setState(() {
      _style = value;
    });
  }

  void _onCurveChanged(ChoiceValue<Curve> value) {
    setState(() {
      _curve = value;
    });
  }

  void _onBarColorChanged(Color value) {
    setState(() {
      _barColor = value;
    });
  }

  void _onGradientChanged(Gradient value) {
    setState(() {
      _gradient = value;
    });
  }

  void _onBadgeChanged(Badge value) {
    setState(() {
      _badge = value;
    });
  }
}
