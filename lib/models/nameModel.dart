import 'dart:core';

class NameModel{
  String ?firstName;
  String ?middle;
  String ?lastName;


  NameModel({this.firstName,this.lastName,this.middle});

  factory NameModel.fromJson(Map data) {
    return NameModel(
      firstName: data["first"],
      lastName: data["last"],
      middle: data["middle"]
    );
  }

}