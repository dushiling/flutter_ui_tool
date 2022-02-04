import 'package:flutter/material.dart';

import 'child/home_drawable_header.dart';


class HomeDrawable extends StatelessWidget {
  HomeDrawable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          HomeDrawableHeader(),
          Divider(),
          ListTile(
              title: Text('联系人'),
              leading: Icon(Icons.supervisor_account),
              trailing: Icon(Icons.chevron_right),
              onTap: () {

              }),
          Divider(),
          ListTile(
              title: Text('检查更新'),
              leading: Icon(Icons.update),
              trailing: Icon(Icons.chevron_right),
              onTap: () async {

              }),
          Divider(),
          ListTile(
              title: Text('退出账号'),
              leading: Icon(Icons.exit_to_app),
              trailing: Icon(Icons.chevron_right),
              onTap: () {

                Navigator.of(context).pop();

              }),
          Divider(),
          ListTile(
              title: Text('设置'),
              leading: Icon(Icons.settings),
              trailing: Icon(Icons.chevron_right),
              onTap: () {


              }),
          Divider(),
        ],
      ),
    );
  }
}
