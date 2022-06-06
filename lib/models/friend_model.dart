import 'package:flutter_apptest/models/base_item_model.dart';
import 'package:flutter_apptest/mvp/model.dart';

class Friend extends BaseItemModel {

  String? email;
  String? phone;
  Friend(int id,String username,this.email,this.phone):super(id,username,);

  @override
  Friend.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    email=json['email'];
    phone=json['phone'];
  }

}

class FriendList extends Model {
  List<Friend> friends;
  bool error;

  FriendList(this.friends, {this.error = false});

  factory FriendList.fromJson(List<dynamic> json) =>
      FriendList((json as Iterable)
          .map((e) => Friend.fromJson(e))
          .toList());

  @override
  Map<String, dynamic> toMap() => {};
}