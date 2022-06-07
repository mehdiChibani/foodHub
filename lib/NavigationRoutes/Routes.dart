import 'package:flutter_apptest/pages/SavedPosts.dart';
import 'package:flutter_apptest/pages/friend_list.dart';
import 'package:flutter_apptest/pages/videos_list.dart';
import 'package:get/get.dart';
import '../pages/Home.dart';

class RoutesClass {
  static String home="/";
  static String friends='/friends';
  static String videos='/videos';
  static String getVideosRoute()=>videos;
  static String getHomeRoute()=>home;
  static String savedPosts="/SavedPosts";
  static String getSavedPosts()=>savedPosts;
  static String getFriends()=>friends;

  static List<GetPage> routes=[
    GetPage(name: home, page: ()=>Home()),
    GetPage(name: savedPosts, page: ()=>SavedPosts(),transition: Transition.leftToRight,transitionDuration:const Duration(seconds: 1)),
    GetPage(name: friends, page: ()=>FriendList(),transition: Transition.leftToRight,transitionDuration:const Duration(seconds: 1)),
    GetPage(name: videos, page: ()=>VideosList(),transition: Transition.leftToRight,transitionDuration:const Duration(seconds: 1)),

  ];


}