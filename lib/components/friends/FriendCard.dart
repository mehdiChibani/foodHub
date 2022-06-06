
import 'package:flutter/material.dart';
import 'package:flutter_apptest/models/friend_model.dart';


class FriendCard extends StatefulWidget {
  final Friend friend;
  FriendCard(this.friend);
  State<StatefulWidget> createState() => new _FriendCard();
}



class _FriendCard extends State<FriendCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.friend.id);
  }


  @override
  Widget build(BuildContext context) {
    return
      ListTile(
        leading:Image.asset(
      'assets/icons/friendicon.png',
    ),
        title:Row(
          children: [
            Icon(Icons.person,size: 13),
            SizedBox(width: 5,),
            Text(widget.friend.username.toString(),style: TextStyle(fontSize:15,color: Colors.grey[600]),),
          ],
        ),
        subtitle: Column(
          children: [
            Row(
              children: [
                Icon(Icons.email_outlined,size: 13,color: Colors.grey[800]),
                SizedBox(width: 5,),
                Text(widget.friend.email.toString(),style: TextStyle(fontSize:15,color: Colors.grey[800]),),
              ],
            ),
            Row(
              children: [
                Icon(Icons.phone,size: 13,color: Colors.grey[900]),
                SizedBox(width: 5,),
                Text(widget.friend.phone.toString(),style: TextStyle(fontSize:15,color: Colors.grey[800]),),
              ],
            ),
          ],
        ),

      );
  }}

