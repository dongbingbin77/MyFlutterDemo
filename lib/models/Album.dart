
import 'package:flutter/material.dart';


class Album {

  int userId;
  int id;
  String title;

  Album({
     this.userId,
     this.id,
     this.title,
  });

  Map<String, dynamic> toJson() {
    return {
      "userId": this.userId,
      "id": this.id,
      "title": this.title,
    };
  }

  factory Album.fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return Album(
      userId: null == (temp = map['userId'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      id: null == (temp = map['id'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      title: map['title']?.toString(),
    );
  }

//

}