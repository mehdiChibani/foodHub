import 'package:flutter_apptest/mvp/model.dart';

class BaseItemModel extends Model {

  String? username;
  BaseItemModel(int id,this.username):super(id: id);

  BaseItemModel.fromJson(Map<String, dynamic> json) : super.fromJson(json){
    if (json.containsKey('username')) username=json['username'];
  }

  Map<String, dynamic> toJson() => toMap();


  Map<String, dynamic> toMap() => {
    'id':id,
    "username": username,
  };
}