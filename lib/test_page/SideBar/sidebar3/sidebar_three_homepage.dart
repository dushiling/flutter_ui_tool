import 'package:flutter/material.dart';

class SideBarThreeHomePage extends StatefulWidget {
  const SideBarThreeHomePage({Key? key}) : super(key: key);

  @override
  _SideBarThreeHomePageState createState() => _SideBarThreeHomePageState();
}

class _SideBarThreeHomePageState extends State<SideBarThreeHomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final Color primary = Colors.white;
  final Color active = Colors.grey.shade800;
  final Color divider = Colors.grey.shade600;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('HomePage'), centerTitle: true),
         drawer: _buildDrawer(context),
        body:Center(child: Text('SideBar3-左侧外部弧形')));
  }

  _buildDrawer(context) {

    return ClipPath(
        clipper: OvalRightBorderClipper(),
        child: Drawer(
            child: Material(
                color: primary,
                child: Container(
                    padding: const EdgeInsets.only(left: 16.0, right: 40),
                    decoration: BoxDecoration(
                        boxShadow: [BoxShadow(color: Colors.black45)]),
                    width: 300,
                    child: SafeArea(
                      child: SingleChildScrollView(
                        child: Column(children: <Widget>[
                          Container(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                  icon: Icon(Icons.power_settings_new,
                                      color: active),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  })),
                          Container(
                              height: 90,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(colors: [
                                    Colors.pink,
                                    Colors.deepPurple
                                  ])),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(80.0)),
                                child: Image.asset('assets/images/sidebar1/userImage.png'),
                              )),
                          SizedBox(height: 5.0),
                          Text("杜杜",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.0)),
                          Text("1197467923@qq.com",
                              style: TextStyle(color: active, fontSize: 16.0)),
                          SizedBox(height: 30.0),
                          _buildRow(context, Icons.home, "Home"),
                          Divider(color: divider),
                          _buildRow(context, Icons.person_pin, "My profile"),
                          Divider(color: divider),
                          _buildRow(context, Icons.message, "Messages",
                              showBadge: true),
                          Divider(color: divider),
                          _buildRow(
                              context, Icons.notifications, "Notifications",
                              showBadge: true),
                          Divider(color: divider),
                          _buildRow(context, Icons.settings, "Settings"),
                          Divider(color: divider),
                          _buildRow(context, Icons.email, "Contact us"),
                          Divider(color: divider),
                          _buildRow(context, Icons.info_outline, "Help"),
                          Divider(color: divider)
                        ]),
                      ),
                    )))));
  }

  Widget _buildRow(context, IconData icon, String title,
      {bool showBadge = false}) {
    final TextStyle tStyle = TextStyle(color: active, fontSize: 16.0);
    return ListTile(
        leading: Icon(icon, color: active),
        title: Text(title, style: tStyle),
        trailing: showBadge
            ? Material(
            color: Colors.deepOrange,
            elevation: 5.0,
            shadowColor: Colors.red,
            borderRadius: BorderRadius.circular(5.0),
            child: Container(
                width: 25,
                height: 25,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(5.0)),
                child: Text("10+",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold))))
            : SizedBox(),
        onTap: () {
          Navigator.pop(context);
        });
  }
}
class OvalRightBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width - 40, 0);
    path.quadraticBezierTo(
        size.width, size.height / 4, size.width, size.height / 2);
    path.quadraticBezierTo(size.width, size.height - (size.height / 4),
        size.width - 40, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}