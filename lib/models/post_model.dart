import 'package:flutter_apptest/models/base_item_model.dart';

class Post extends BaseItemModel {

  int? likes;
  int? comments;
  String? date;
  String? imgUrl;
  String? userImg;
  bool? isSaved;
  Post(int id, String username,
      this.likes,
      this.comments,
      this.date,
      this.imgUrl,
      this.userImg,
      this.isSaved
      ):super(id,username,);

  Map<String, dynamic> toJson() => toMap();





Map<String, dynamic> toMap() => {
    'id':id,
    "username": username,
    'likes': likes,
    'comments': comments,
    'date' :date,
    'imgUrl' :imgUrl,
    'userImg': userImg,
    'isSaved':isSaved
  };

  Post.fromJson(Map<String, dynamic> json):super.fromJson(json) {

        likes = json['likes'];
        comments = json['comments'];
        date = json['date'];
        imgUrl = json['imgUrl'];
        userImg = json['userImg'];
        isSaved=json['isSaved'];


  }


}