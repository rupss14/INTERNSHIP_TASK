/// success : true
/// message : "New access token assigned"
/// data : {"accessToken":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZU51bWJlciI6Ijk5OTk5OTk5OTkiLCJpYXQiOjE3MDkwMzYxODEsImV4cCI6MTcwOTA1Nzc4MX0.SWWHxS1YhdbN0nqbQJQS3_1Z_9OxYhEoaea3JVLmxmw"}

class GetAccessTokenModel {
  GetAccessTokenModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetAccessTokenModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
GetAccessTokenModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => GetAccessTokenModel(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get success => _success;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// accessToken : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZU51bWJlciI6Ijk5OTk5OTk5OTkiLCJpYXQiOjE3MDkwMzYxODEsImV4cCI6MTcwOTA1Nzc4MX0.SWWHxS1YhdbN0nqbQJQS3_1Z_9OxYhEoaea3JVLmxmw"

class Data {
  Data({
      String? accessToken,}){
    _accessToken = accessToken;
}

  Data.fromJson(dynamic json) {
    _accessToken = json['accessToken'];
  }
  String? _accessToken;
Data copyWith({  String? accessToken,
}) => Data(  accessToken: accessToken ?? _accessToken,
);
  String? get accessToken => _accessToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['accessToken'] = _accessToken;
    return map;
  }

}