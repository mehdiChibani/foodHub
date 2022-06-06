
import 'package:flutter/material.dart';



class PostCard extends StatefulWidget {
  final post;
  final Function(String id) savePost;

  PostCard(this.post,this.savePost);
  State<StatefulWidget> createState() => new _PostCard();
}



class _PostCard extends State<PostCard> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Column(children: [
      Row(children: [
        CircleAvatar(
          radius: 20.0,
          backgroundImage:NetworkImage(widget.post['userImg'].toString()),backgroundColor: Colors.transparent,),
        SizedBox(width: 10,),
        Text(widget.post['username'].toString())
      ],),
      Padding(
          padding: EdgeInsets.all(5),
          child:Image(fit: BoxFit.cover,height: 100,width: 300,image: NetworkImage(widget.post['imgUrl'].toString()),)),
      SizedBox(height: 10,),
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
          SizedBox(width: 20,),
          SizedBox(
              height: 30,
              width: 40,
              child:
          Stack(



      children:[
      AnimatedPositioned(
        height: 30,
        width: 30,
        duration: const Duration(milliseconds: 2000),
        curve: Curves.fastOutSlowIn,
        left: widget.post['isSaved']?10.0:1.0,
        child: GestureDetector(
          child: Icon(
            Icons.save_alt,
            color:widget.post['isSaved']?Colors.blueAccent: Colors.black45,
          ),
          onTap: ()=>{
            widget.savePost(widget.post['id'].toString())
          },
        ),

      )],))





          // AnimatedContainer(
          //   color: widget.post['isSaved']?Colors.blueAccent:Colors.red,
          //
          //   // Use the properties stored in the State class.
          //
          //
          //   // Define how long the animation should take.
          //   duration: const Duration(seconds: 2),
          //   // Provide an optional curve to make the animation feel smoother.
          //   curve: Curves.fastOutSlowIn,
          // )


        ],),

    ],),);

  }}

