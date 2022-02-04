import 'package:flutter/material.dart';
import 'package:flutter_ui_tool/test_page/Address/address2/child/utils.dart';
import 'package:flutter_ui_tool/utils/tost_util.dart';
import 'package:flutter_ui_tool/utils/utils.dart';
import 'package:flutter_ui_tool/widgets/image_load_view.dart';
import 'package:flutter_ui_tool/widgets/sl_app_bar_widget.dart';

const List<String> languages = <String>[
  'Flutter',
  'Android',
  'iOS',
  'Java',
  'Object-C',
  'JavaScript',
  'Ruby',
  'PHP',
  'C++',
  'C#',
  'C语言',
  'Dart',
  'Kotlin',
  'Swift'
];

class ChipWidget extends StatefulWidget {
  @override
  createState() => _ChipWidgetState();
}

class _ChipWidgetState extends State<ChipWidget> {
  String _selectedMaterial = '';

  List<String> _actions = [];

  List<String> _selected = [];

  @override
  void initState() {
    super.initState();
    _actions.addAll(languages);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SLAppBarWidget(title:'Chip Widget'),
        body: ListView(padding: EdgeInsets.all(10.0), children: <Widget>[
          Text('Chip'),
          Wrap(
              spacing: 10.0,
              children: _actions
                  .map((language) => Chip(
                      backgroundColor: Utils.strToColor(language),
                      label: Text(language.toString(),
                          style: TextStyle(color: Colors.white)),
                      onDeleted: () =>
                          setState(() => _actions.remove(language))))
                  .toList()),
          Text('ChoiceChip'),
          Wrap(
              spacing: 10.0,
              children: languages
                  .map((language) => ChoiceChip(
                      selected: _selectedMaterial == language,
                      backgroundColor: Colors.grey,
                      label: Text(language.toString(),
                          style: TextStyle(color: Colors.white)),
                      selectedColor: Utils.strToColor(language),
                      onSelected: (bool isCheck) => setState(
                          () => _selectedMaterial = isCheck ? language : "")))
                  .toList()),
          Text('InputChip'),
          Wrap(
              spacing: 10.0,
              children: languages
                  .map((language) => InputChip(
                      label: Text(language.toString(),
                          style: TextStyle(color: Colors.white)),
                      avatar: ImageLoadView(
                          'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1408166520,3304498136&fm=26&gp=0.jpg',
                          radius: 20),
                      onPressed: () {},
                      backgroundColor: Utils.strToColor(language)))
                  .toList()),
          Text('FilterChip'),
          Wrap(
              spacing: 10.0,
              children: languages
                  .map((language) => FilterChip(
                      backgroundColor: Utils.strToColor(language),
                      label: Text(language),
                      selected: _selected.contains(language),
                      onSelected: (isSelected) => setState(() {
                            if (_selected.contains(language)) {
                              _selected.remove(language);
                            } else {
                              _selected.add(language);
                            }
                          }),
                      selectedColor: Utils.strToColor(language)))
                  .toList()),
          Text('ActionChip'),
          Wrap(
              spacing: 10.0,
              children: languages
                  .map((language) => ActionChip(
                      backgroundColor: Utils.strToColor(language),
                      label: Text(language),
                      onPressed: () => TostUtil.showToast(language)))
                  .toList())
        ]));
  }
}
