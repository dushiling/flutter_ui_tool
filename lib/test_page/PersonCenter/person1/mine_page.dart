import 'dart:io';
import 'package:clippy_flutter/arc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:flutter_ui_tool/config/data.dart';
import 'package:flutter_ui_tool/test_page/Mine/mine2/child/select_text_item.dart';
import 'package:flutter_ui_tool/utils/style_util.dart';
import 'package:flutter_ui_tool/utils/tost_util.dart';
import 'package:flutter_ui_tool/widgets/image_load_view.dart';
import 'package:flutter_ui_tool/widgets/sl_app_bar_widget.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'child/input_text_view.dart';




class PerSonOnePage extends StatefulWidget {
  PerSonOnePage({Key? key}) : super(key: key);

  @override
  createState() => _PerSonOnePageState();
}

class _PerSonOnePageState extends State<PerSonOnePage> {
  bool isEdit = false;
  bool isShowLoading = false;

  late XFile _imageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(children: <Widget>[
                Container(
                    height: 250,
                    child: Stack(children: <Widget>[
                      Arc(
                          child: ImageLoadView(backgroundImage,
                              fit: BoxFit.cover,
                              height: 210,
                              width: double.infinity),
                          height: 30,
                          edge: Edge.BOTTOM,
                          arcType: ArcType.CONVEX),
                      Positioned(
                          child: Container(
                            child: Column(children: <Widget>[
                              Align(
                                  alignment: Alignment.center,
                                  child: InkWell(
                                      onTap: isEdit
                                          ? () =>Get.to(InputTextPage(
                                          title: '修改姓名',
                                          content:
                                          '杜杜',
                                          maxLines: 1,
                                          maxLength: 5))

                                          // pushNewPage(
                                          // context,
                                          // InputTextPage(
                                          //     title: '修改姓名',
                                          //     content:
                                          //     '杜杜',
                                          //     maxLines: 1,
                                          //     maxLength: 5),
                                          // callBack: (value) {
                                          //   // userModel.setUser(name: value);
                                          // })
                                          : null,
                                      child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text('杜杜',
                                                style:
                                                TextStyles.textWhite32),
                                            Offstage(
                                                offstage: !isEdit,
                                                child: Icon(Icons.edit,
                                                    color: Colors.white,
                                                    size: 15))
                                          ]))),
                              SizedBox(height: 5),
                              Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    Hero(
                                      child: ImageLoadView(
                                          avatarImage,
                                          shape: BoxShape.circle,
                                          width: 80,
                                          height: 80),
                                      tag: 'user_avatar',
                                    ),
                                    Offstage(
                                        offstage: !isEdit,
                                        child: IconButton(
                                            icon: Icon(Icons.photo_camera,
                                                color: Colors.white),
                                            onPressed: () => choiceImage()))
                                  ])
                            ]),
                          ),
                          bottom: 0,
                          right: 0,
                          left: 0),
                    ])),
                Divider(),
                SelectTextItem(
                    leading: Icon(Icons.email, size: 26),
                    title: '邮箱',
                    content: '1197467923@qq.com',
                    margin: EdgeInsets.only(left: 16.0, right: 8),
                    onTap: isEdit
                        ? () =>
                        Get.to( InputTextPage(
                          title: '修改邮箱',
                          content: '1197467923@qq.com',
                          maxLines: 1,
                          keyboardType: TextInputType.emailAddress,
                        ))
                    //     pushNewPage(
                    //     context,
                    //     InputTextPage(
                    //       title: '修改邮箱',
                    //       content: '1197467923@qq.com',
                    //       maxLines: 1,
                    //       keyboardType: TextInputType.emailAddress,
                    //     ), callBack: (value) {
                    //   // userModel.setUser(email: value);
                    // })
                        : null,
                    textAlign: TextAlign.right),
                Divider(),
              ]),
            ),
            ToolBar(
              title: Text(
                '个人中心',
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
              actions: <Widget>[
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return ScaleTransition(child: child, scale: animation);
                  },
                  child: isEdit
                      ? IconButton(
                      key: ValueKey('Done'),
                      icon: Text('完成',
                          style: TextStyle(
                              fontSize: 15, color: Colors.white)),
                      onPressed: () => setState(() => isEdit = !isEdit))
                      : IconButton(
                      key: ValueKey('Edit'),
                      icon: Text('编辑',
                          style: TextStyle(
                              fontSize: 15, color: Colors.white)),
                      onPressed: () => setState(() => isEdit = !isEdit)),
                )
              ],
            ),
          ],
        ));
  }

  choiceImage() {
    showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(actions: <Widget>[
              CupertinoDialogAction(
                  child: Text('拍摄', style: TextStyles.textBlue32),
                  onPressed: () => fromCamera()),
              CupertinoDialogAction(
                  child: Text('从相册选择', style: TextStyles.textBlue32),
                  onPressed: () => fromGallery()),
              CupertinoDialogAction(
                  child: Text('取消',
                      style: TextStyles.textRed32),
                  onPressed: () => Navigator.pop(context))
            ]));
  }

  /// 从相机
  fromCamera() async {
    Navigator.of(context).pop();
    try {

      // var image = await ImagePicker().getImage(source: ImageSource.camera);
      // _cropImage(image!);

      final XFile? photo= await _picker.pickImage(source: ImageSource.camera);
      _cropImage(photo!);

    } catch (e) {
      print(e);
    }
  }

  /// 从相册
  fromGallery() async {
    Navigator.of(context).pop();
    try {

      // var image = await ImagePicker().getImage(source: ImageSource.gallery);
      // _cropImage(image!);
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      _cropImage(image!);

    } catch (e) {
      print(e);
    }
  }

  // setImgPath(XFile file) async {
  //   debugPrint("setImgPath()====$file");
  //   setState(() {
  //     _imageFile = file;
  //   });
  //   debugPrint('${_imageFile.path}');
  //   _cropImage(file);
  // }

  /// 裁剪
  Future<Null> _cropImage(XFile imageFile) async {
    assert(imageFile != null);
    File? croppedFile = await ImageCropper.cropImage(
      /// 图像文件的绝对路径。
      sourcePath: imageFile.path,

      /// 最大裁剪的图像宽度
      maxWidth: 256,

      /// 最大裁剪的图像高度
      maxHeight: 256,

      /// 控制裁剪菜单视图中纵横比的列表。在Android中，您可以通过设置的值来设置启动裁切器时的初始化纵横比AndroidUiSettings.initAspectRatio
      aspectRatioPresets: [CropAspectRatioPreset.square],

      /// 控制裁剪边界的样式，可以是矩形或圆形样式
      cropStyle: CropStyle.circle,

      /// 结果图像的格式，png或jpg
      compressFormat: ImageCompressFormat.jpg,

      /// 用于控制图像压缩的质量，取值范围[1-100]
      compressQuality: 100,
      androidUiSettings: AndroidUiSettings(
        toolbarTitle: "裁剪",
        toolbarColor: Theme.of(context).secondaryHeaderColor,
        statusBarColor: Theme.of(context).secondaryHeaderColor,
        toolbarWidgetColor: Colors.white,
      ),
      iosUiSettings: IOSUiSettings(
        minimumAspectRatio: 1.0,
        doneButtonTitle: '确定',
        cancelButtonTitle: '取消',
      ),
    );

    debugPrint('cropImage=============${croppedFile!.path}');

    // showLoadingDialog(context, '上传中...');
    TostUtil.showLoading(msg: '上传中...');
    isShowLoading = true;
    uploadImage(croppedFile.path);
  }

  void uploadImage(String path) async {
    var filename = path.substring(path.lastIndexOf("/") + 1, path.length);
    debugPrint(filename);
    var suffix = filename.substring(filename.lastIndexOf(".") + 1, filename.length);
    debugPrint(suffix);

    // FormData data = FormData.fromMap({
    //   'avatar': MultipartFile.fromFileSync(path, filename: filename),
    //   'id': Store.value<UserModel>(context, listen: false).getUserId(),
    // });
    //
    // User user = await ApiService.updateAvatar(data);
    //
    // if (user != null) {
    //   Store.value<UserModel>(context, listen: false)
    //       .setUser(avatarPath: user.avatarUrl);
    //   if (isShowLoading) {
    //     Navigator.of(context).pop();
    //   }
    // }
  }
}
