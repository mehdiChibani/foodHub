import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_apptest/components/savedPosts/postCard.dart';
import 'package:get/get.dart';
import '../models/post_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';

class SavedPosts extends StatefulWidget {
  State<StatefulWidget> createState() => new _SavedPosts();
}



class _SavedPosts extends State<SavedPosts> {

  var loading=true;
  List<dynamic> posts=[];


  @override
  void initState(){
    final box = GetStorage();
    List<dynamic> postMap=json.decode(box.read('posts'));
    print("userImg");
    print(postMap[1]['user']);
    new Future.delayed(const Duration(milliseconds: 5000), () =>setState(() {
      posts=postMap;
      loading = false;
    }));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title:const Text('Enregistrement'),backgroundColor: Colors.deepOrangeAccent,),
      body:
      loading?
      Center(
          child:
          // Load a Lottie file from your assets
          Lottie.asset('assets/animations/bookmark.json'),)
          :Container(
          padding: EdgeInsets.only(top: 15),
          child: GridView.builder(
            itemCount: posts.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0
            ),
            itemBuilder: (BuildContext context, int index){
              return PostCard(posts[index],(var id)=>{

                for(var i=0;i<posts.length;i++){
                  if(posts[i]['id'].toString()==id){
                    this.setState(() {
                      posts[i]['isSaved']=!posts[i]['isSaved'];
                    }),
                    print(posts[i]['isSaved']),
                    Get.snackbar('', posts[i]['isSaved']?'element sauvgardé':'element suprimé',snackPosition:SnackPosition.BOTTOM ,margin: EdgeInsets.all(100),duration: Duration(milliseconds: 1000))
                  }

                },


              }
              );
            },
          )),


    );

  }
}