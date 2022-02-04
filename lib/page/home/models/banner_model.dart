/// code : 0
/// description : "成功"
/// data : [{"imgurl":"http://rc.img.gs77.cc/pudding/admin/5f118481f1a74fa78ea7ce1a8fd325f4.jpeg","url":"www.baidu.com?token=","token":""}]

class BannerModel {
  BannerModel({
      int? code,
      String? description,
      List<Data>? data,}){
    _code = code!;
    _description = description!;
    _data = data!;
}

  BannerModel.fromJson(dynamic json) {
    _code = json['code'];
    _description = json['description'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data!.add(Data.fromJson(v));
      });
    }
  }
  int? _code;
  String? _description;
  List<Data>? _data;

  int? get code => _code;
  String? get description => _description;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['description'] = _description;
    if (_data != null) {
      map['data'] = _data!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// imgurl : "http://rc.img.gs77.cc/pudding/admin/5f118481f1a74fa78ea7ce1a8fd325f4.jpeg"
/// url : "www.baidu.com?token="
/// token : ""

class Data {
  Data({
      String? imgurl,
      String? url,
      String? token,}){
    _imgurl = imgurl!;
    _url = url!;
    _token = token!;
}

  Data.fromJson(dynamic json) {
    _imgurl = json['imgurl'];
    _url = json['url'];
    _token = json['token'];
  }
  String? _imgurl;
  String? _url;
  String? _token;

  String? get imgurl => _imgurl;
  String? get url => _url;
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['imgurl'] = _imgurl;
    map['url'] = _url;
    map['token'] = _token;
    return map;
  }

}