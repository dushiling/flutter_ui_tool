import 'package:flutter/material.dart';
import 'package:flutter_ui_tool/widgets/sl_app_bar_widget.dart';

class RangeSliderPage extends StatefulWidget {
  RangeSliderPage({Key? key}) : super(key: key);

  @override
  createState() => _RangeSliderPageState();
}

class _RangeSliderPageState extends State<RangeSliderPage> {
  var _continuousValues = const RangeValues(25.0, 75.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SLAppBarWidget(title:'RangeSlider Demo'),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
                '${_continuousValues.start.round()}  -  ${_continuousValues.end.round()}'),
            RangeSlider(
              activeColor: Colors.red,
              inactiveColor: Colors.green,
              divisions: 100,
              values: _continuousValues,
              min: 0.0,
              max: 100.0,
              onChanged: (RangeValues values) {
                setState(() {
                  _continuousValues = values;
                });
              },
              labels: RangeLabels('${_continuousValues.start.round()}',
                  '${_continuousValues.end.round()}'),
            ),
            RangeSlider(
              values: RangeValues(0.25, 0.75),
              onChanged: null,
            ),
            RangeSlider(
              activeColor: Colors.red,
              inactiveColor: Colors.green,
              values: _continuousValues,
              min: 0.0,
              max: 100.0,
              onChanged: (RangeValues values) {
                setState(() {
                  _continuousValues = values;
                });
              },
            )
          ],
          mainAxisSize: MainAxisSize.min,
        ),
      ),
    );
  }
}
