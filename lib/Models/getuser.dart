/// success : true
/// message : "Fetched user data successfully"
/// data : {"user":{"id":3,"name":"Subha","phoneNumber":"9999999999","gender":"male","place_of_birth":"Cuttack","date_of_birth":"2024-02-07T00:00:00.000Z","time_of_birth":"2024-02-07T11:21:01.739Z","status":"active","createdAt":"2024-02-27T05:09:58.260Z","updatedAt":"2024-02-27T12:07:55.244Z"}}

class Getuser {
  Getuser({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  Getuser.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
Getuser copyWith({  bool? success,
  String? message,
  Data? data,
}) => Getuser(  success: success ?? _success,
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

/// user : {"id":3,"name":"Subha","phoneNumber":"9999999999","gender":"male","place_of_birth":"Cuttack","date_of_birth":"2024-02-07T00:00:00.000Z","time_of_birth":"2024-02-07T11:21:01.739Z","status":"active","createdAt":"2024-02-27T05:09:58.260Z","updatedAt":"2024-02-27T12:07:55.244Z"}

class Data {
  Data({
      User? user,}){
    _user = user;
}

  Data.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  User? _user;
Data copyWith({  User? user,
}) => Data(  user: user ?? _user,
);
  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}

/// id : 3
/// name : "Subha"
/// phoneNumber : "9999999999"
/// gender : "male"
/// place_of_birth : "Cuttack"
/// date_of_birth : "2024-02-07T00:00:00.000Z"
/// time_of_birth : "2024-02-07T11:21:01.739Z"
/// status : "active"
/// createdAt : "2024-02-27T05:09:58.260Z"
/// updatedAt : "2024-02-27T12:07:55.244Z"

class User {
  User({
      num? id, 
      String? name, 
      String? phoneNumber, 
      String? gender, 
      String? placeOfBirth, 
      String? dateOfBirth, 
      String? timeOfBirth, 
      String? status, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _phoneNumber = phoneNumber;
    _gender = gender;
    _placeOfBirth = placeOfBirth;
    _dateOfBirth = dateOfBirth;
    _timeOfBirth = timeOfBirth;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  User.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _phoneNumber = json['phoneNumber'];
    _gender = json['gender'];
    _placeOfBirth = json['place_of_birth'];
    _dateOfBirth = json['date_of_birth'];
    _timeOfBirth = json['time_of_birth'];
    _status = json['status'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  num? _id;
  String? _name;
  String? _phoneNumber;
  String? _gender;
  String? _placeOfBirth;
  String? _dateOfBirth;
  String? _timeOfBirth;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
User copyWith({  num? id,
  String? name,
  String? phoneNumber,
  String? gender,
  String? placeOfBirth,
  String? dateOfBirth,
  String? timeOfBirth,
  String? status,
  String? createdAt,
  String? updatedAt,
}) => User(  id: id ?? _id,
  name: name ?? _name,
  phoneNumber: phoneNumber ?? _phoneNumber,
  gender: gender ?? _gender,
  placeOfBirth: placeOfBirth ?? _placeOfBirth,
  dateOfBirth: dateOfBirth ?? _dateOfBirth,
  timeOfBirth: timeOfBirth ?? _timeOfBirth,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get name => _name;
  String? get phoneNumber => _phoneNumber;
  String? get gender => _gender;
  String? get placeOfBirth => _placeOfBirth;
  String? get dateOfBirth => _dateOfBirth;
  String? get timeOfBirth => _timeOfBirth;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['phoneNumber'] = _phoneNumber;
    map['gender'] = _gender;
    map['place_of_birth'] = _placeOfBirth;
    map['date_of_birth'] = _dateOfBirth;
    map['time_of_birth'] = _timeOfBirth;
    map['status'] = _status;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}