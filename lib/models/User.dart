

import 'package:json_annotation/json_annotation.dart';


@JsonSerializable(explicitToJson: true )
class User{
  String name;
  int id;


  User(this.name, this.id);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json['id'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
      };

//
  // factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  // Map<String, dynamic> toJson() => _$UserToJson(this);
}