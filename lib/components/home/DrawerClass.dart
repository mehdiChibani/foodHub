import 'package:flutter/material.dart';
import 'package:flutter_apptest/NavigationRoutes/Routes.dart';
import 'package:get/get.dart';

class DrawerClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(child:
    ListView(
      // Remove padding
        padding: EdgeInsets.zero,
        children: [
    UserAccountsDrawerHeader(
    accountName: Text('eanne Graham'),
      accountEmail: Text('Sincere@april.biz'),
      currentAccountPicture: CircleAvatar(
        child: ClipOval(
          child: Image.network(
            'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
            fit: BoxFit.cover,
            width: 90,
            height: 90,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.blue,
        image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
                'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
      ),
    ),
    ListTile(
    leading: Icon(Icons.supervised_user_circle),
    title: Text('friend_label'.tr),
        onTap: () =>
        {
        Scaffold.of(context).openDrawer(),

            Get.toNamed(RoutesClass.friends)}
    ),
    ListTile(
    leading: Icon(Icons.save_alt),
    title: Text('saved_posts_label'.tr),
    onTap: () =>{
        Scaffold.of(context).openDrawer(),

        Get.toNamed(RoutesClass.savedPosts)}
    )],
    ),


    );
  }
}