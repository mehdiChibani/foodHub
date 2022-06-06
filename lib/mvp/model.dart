import '../constants/general_constants.dart';

abstract class Model {
  int? id;

  int get getId => id ?? -1;

  Model({this.id = -1});




  Model.fromJson(Map<String, dynamic> json) {
    if (json.containsKey(idKEY)) id = json[idKEY];
  }

  Map<String, dynamic> toJson() => toMap();


  Map<String, dynamic> toMap() => {
    "id": id,
  };



}
