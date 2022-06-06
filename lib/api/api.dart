import 'dart:convert';

import 'package:flutter_apptest/models/friend_model.dart';
import 'api_exceptions.dart';
import 'package:http/http.dart';

class Api {
  static const String PROTOCOL = "http";
  static const String AUTHORITY = "jsonplaceholder.typicode.com";
  static const String BASE_URL = "$PROTOCOL://$AUTHORITY";
  static const String USERS="$BASE_URL/users";

  Future<FriendList> getFriends() async {
    Response response = await get(
      Uri.parse(USERS),
    );
    print('response.body');
    print(USERS);
    if (response.statusCode == 200) {
      return FriendList.fromJson(jsonDecode(response.body));
    }
    throw Exception();
  }
}