
import 'package:flutter/material.dart';
import 'package:flutter_apptest/components/friends/friends_list.dart';
import 'package:get/get.dart';


class FriendList extends StatefulWidget {
  State<StatefulWidget> createState() => new _FriendList();
}



class _FriendList extends State<FriendList> {


  @override
  void initState(){



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('friend_label'.tr),backgroundColor: Colors.deepOrangeAccent,),
        body: FriendsList()

    );

  }
}