import 'package:flutter/material.dart';

import 'condition.dart';


class FilterListView extends StatelessWidget {
  final List<Condition> items;
  final Function(Condition value) itemOnTap;

  FilterListView({Key? key, required this.items, required this.itemOnTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (BuildContext context, int index) => SizedBox(height: 3),
      itemBuilder: (BuildContext context, int index) {
        return Material(
          child: InkWell(
            onTap: () {
              for (var value in items) {
                value.isSelected = false;
              }
              items[index].isSelected = true;

              itemOnTap(items[index]);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 57,
              child: Row(children: <Widget>[
                Expanded(
                  child: Text(
                    items[index].title,
                    style: TextStyle(
                        color: items[index].isSelected
                            ? Theme.of(context).primaryColor
                            : Colors.black),
                  ),
                ),
                items[index].isSelected
                    ? Icon(Icons.check,
                        color: Theme.of(context).primaryColor, size: 16)
                    : SizedBox(),
              ]),
            ),
          ),
        );
      },
    );
  }
}
