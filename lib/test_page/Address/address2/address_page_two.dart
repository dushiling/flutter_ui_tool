import 'package:flutter/material.dart';

class AddressPageTwo extends StatefulWidget {
  const AddressPageTwo({Key? key}) : super(key: key);

  @override
  _AddressPageTwoState createState() => _AddressPageTwoState();
}

class _AddressPageTwoState extends State<AddressPageTwo> {
   String address='请选择';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: [
            ListTile(
                onTap: () => {},
                leading: Icon(Icons.location_on),
                title: Text('选择地址'),
                trailing: Container(
                  width: 160.0,
                  child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Expanded(
                        child: Text(
                          '${address }',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.right,
                          style: Theme.of(context).textTheme.caption,
                        )),
                    Icon(Icons.navigate_next)
                  ]),
                )),
          ],
        ),
    );
  }

  // void _chooseAddress() {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return JDAddressDialog(
  //             onSelected: (province, city, county) {
  //               setState(() {
  //                 address = '$province$city$county';
  //                 TostUtil.showToast('$province-$city-$county');
  //               });
  //             },
  //             title: '选择地址');
  //       });
  // }
}
