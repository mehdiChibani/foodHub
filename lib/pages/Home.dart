import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/home/DrawerClass.dart';
import '../models/post_model.dart';
import 'package:get_storage/get_storage.dart';


class Home extends StatefulWidget {
  State<StatefulWidget> createState() => new _Home();
}


class _Home extends State<Home> {
  int selectedIndex = 1;
  List<IconData> data = [
    Icons.no_meals,
    Icons.home,
    Icons.search,
  ];
  List<Post> posts = [];
  @override
  void initState(){
    posts.add(Post(1,'Mehdi chibani',34,45,'14:45 06/03/2022','https://3gz8cg829c.execute-api.us-west-2.amazonaws.com/prod/image-renderer/16x9/full/1015/center/80/6b7a7c7c-3c44-489c-9880-4a17508cdc6d-large16x9_Postworkout_meal.jpg',
      'https://dm.henkel-dam.com/is/image/henkel/men_perfect_com_thumbnails_home_pack_400x400-wcms-international?scl=1&fmt=jpg',false
    ));
    posts.add(Post(2,'Jonny Deep',34,45,'14:45 06/03/2022','https://img.taste.com.au/DVq53FOO/w720-h480-cfill-q80/taste/2018/10/lean-beef-y-meat-142271-5.jpg','https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Johnny_Depp_Deauville_2019.jpg/640px-Johnny_Depp_Deauville_2019.jpg',true
    ));
    posts.add(Post(3,'Patricia Lebsack',34,45,'14:45 06/03/2022','https://assets-global.website-files.com/5d03b4e13011831ae4624b37/61ff6b8686c6708c070e7d41_production-meal-image-e4122aa8-0fe7-4854-b6f5-e27e0c5be918.jpeg','https://images.assetsdelivery.com/compings_v2/zagorodnaya/zagorodnaya1811/zagorodnaya181100857.jpg',false
    ));
    final box = GetStorage();
    box.write('posts','[]');
    List<dynamic> postMap=json.decode(box.read('posts'));
    if(postMap!=null){
      box.write('posts',json.encode(posts) );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:DrawerClass(),
      resizeToAvoidBottomInset: false,

      appBar: AppBar(
        leading:Builder(builder: (context) => Padding(
          padding: EdgeInsets.all(5),
          child:
          GestureDetector(onTap: () => Scaffold.of(context).openDrawer(),
          child:
          CircleAvatar(
            radius: 20.0,
            backgroundImage:NetworkImage('https://dm.henkel-dam.com/is/image/henkel/men_perfect_com_thumbnails_home_pack_400x400-wcms-international?scl=1&fmt=jpg'),     backgroundColor: Colors.transparent,),
        ))),
        backgroundColor: Colors.deepOrangeAccent,
        title:  Center(
          child: Text("home_navbar_title".tr,style: TextStyle(fontFamily: 'Lobster'),),
        ),
        actions: const [
      Padding(
      padding: EdgeInsets.all(5),
        child:
          Icon(
            Icons.settings,
            color: Colors.white,
          ), ),
          Padding(
            padding: EdgeInsets.all(5),
            child:
            Icon(
              Icons.add_circle,
              color: Colors.white,
            ), ),
        ],

      ),
      body:
            ListView.builder(
            shrinkWrap: true,
        itemCount:posts.length,

                itemBuilder: (BuildContext context,int index){return
              Column(children: [
                Padding(
                    padding: EdgeInsets.all(5),
                    child:
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20.0,
                          backgroundImage:NetworkImage(posts[index].userImg.toString()),backgroundColor: Colors.transparent,),

                        Padding(padding: EdgeInsets.only(right: 5),
                          child: Column(
                            children: [
                              Text(' '+posts[index].username.toString()),
                              Text(' '+posts[index].date.toString(),style: TextStyle(
                                  fontSize: 15,color: Colors.grey
                              ),)
                            ],
                          ),
                        )
                      ],
                    )),

                Padding(
                    padding: EdgeInsets.all(5),
                    child:Image(image: NetworkImage(posts[index].imgUrl.toString()))),
                Row(

                  children: [
                    SizedBox(width: 15,),
                    Icon(
                      Icons.favorite_border,
                      color: Colors.redAccent,
                    ),
                    SizedBox(width: 15,),
                    Icon(
                      Icons.comment,
                      color: Colors.black12,
                    ),
                    SizedBox(width: 15,),
                    Icon(
                      Icons.share,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(width: 250,),
                    Icon(
                      Icons.save_alt,
                      color: Colors.black45,
                    )
                  ],),
                Text(posts[index].likes.toString()+' of likes' ),
                SizedBox(height: 15,),
              ],);
            }
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,bottom: 15,top: 3),
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(15),
          color: Color(0xFFff9966),
          child: Container(
            height: 60,
            width: double.infinity,
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                width: 60,
              ),
              itemCount: data.length,
              padding: EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (ctx, i) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = i;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 250),
                    width: 50,
                    decoration: BoxDecoration(
                      border: i == selectedIndex
                          ? Border(
                          top: BorderSide(
                              width: 4.0, color: Colors.white))
                          : null,
                    ),
                    child: Icon(
                      data[i],
                      size: 30,
                      color: i == selectedIndex
                          ? Colors.white
                          : Color(0xFFffccb3),
                    ),
                  ),
                ),
              ),
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
      ),

    );

  }
}