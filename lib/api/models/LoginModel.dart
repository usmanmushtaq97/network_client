/// code : 1
/// message : "User login successfully"
/// data : {"accessToken":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InRlc3R1c2VyMTIzNDVAbWFpbGluYXRvci5jb20iLCJpYXQiOjE2ODEyMjgwMDAsImV4cCI6MTY4MTMxNDQwMH0.z3f0wtIhHYgPt9myn3FFOVyoUzh_SDTFiimihF66kl8","user":{"_id":"64330a63572969ff51173504","firstName":"Test","lastName":"User","email":"testuser12345@mailinator.com","user_channel_type":"tiktok","avatar":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQj7X3-fd9S3Mvo_zUbMdEOg0biq8hNQ9Bzng&usqp=CAU","createdAt":"2023-04-09T18:56:35.786Z","updatedAt":"2023-04-09T18:56:35.786Z","__v":0}}

class LoginModel {
  LoginModel({
      num? code, 
      String? message, 
      Data? data,}){
    _code = code;
    _message = message;
    _data = data;
}

  LoginModel.fromJson(dynamic json) {
    _code = json['code'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  num? _code;
  String? _message;
  Data? _data;
LoginModel copyWith({  num? code,
  String? message,
  Data? data,
}) => LoginModel(  code: code ?? _code,
  message: message ?? _message,
  data: data ?? _data,
);
  num? get code => _code;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// accessToken : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InRlc3R1c2VyMTIzNDVAbWFpbGluYXRvci5jb20iLCJpYXQiOjE2ODEyMjgwMDAsImV4cCI6MTY4MTMxNDQwMH0.z3f0wtIhHYgPt9myn3FFOVyoUzh_SDTFiimihF66kl8"
/// user : {"_id":"64330a63572969ff51173504","firstName":"Test","lastName":"User","email":"testuser12345@mailinator.com","user_channel_type":"tiktok","avatar":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQj7X3-fd9S3Mvo_zUbMdEOg0biq8hNQ9Bzng&usqp=CAU","createdAt":"2023-04-09T18:56:35.786Z","updatedAt":"2023-04-09T18:56:35.786Z","__v":0}

class Data {
  Data({
      String? accessToken, 
      User? user,}){
    _accessToken = accessToken;
    _user = user;
}

  Data.fromJson(dynamic json) {
    _accessToken = json['accessToken'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? _accessToken;
  User? _user;
Data copyWith({  String? accessToken,
  User? user,
}) => Data(  accessToken: accessToken ?? _accessToken,
  user: user ?? _user,
);
  String? get accessToken => _accessToken;
  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['accessToken'] = _accessToken;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}

/// _id : "64330a63572969ff51173504"
/// firstName : "Test"
/// lastName : "User"
/// email : "testuser12345@mailinator.com"
/// user_channel_type : "tiktok"
/// avatar : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQj7X3-fd9S3Mvo_zUbMdEOg0biq8hNQ9Bzng&usqp=CAU"
/// createdAt : "2023-04-09T18:56:35.786Z"
/// updatedAt : "2023-04-09T18:56:35.786Z"
/// __v : 0

class User {
  User({
      String? id, 
      String? firstName, 
      String? lastName, 
      String? email, 
      String? userChannelType, 
      String? avatar, 
      String? createdAt, 
      String? updatedAt, 
      num? v,}){
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _userChannelType = userChannelType;
    _avatar = avatar;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  User.fromJson(dynamic json) {
    _id = json['_id'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _email = json['email'];
    _userChannelType = json['user_channel_type'];
    _avatar = json['avatar'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _id;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _userChannelType;
  String? _avatar;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
User copyWith({  String? id,
  String? firstName,
  String? lastName,
  String? email,
  String? userChannelType,
  String? avatar,
  String? createdAt,
  String? updatedAt,
  num? v,
}) => User(  id: id ?? _id,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  email: email ?? _email,
  userChannelType: userChannelType ?? _userChannelType,
  avatar: avatar ?? _avatar,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  v: v ?? _v,
);
  String? get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get userChannelType => _userChannelType;
  String? get avatar => _avatar;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['email'] = _email;
    map['user_channel_type'] = _userChannelType;
    map['avatar'] = _avatar;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}