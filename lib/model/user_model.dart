// {
// "email" = "dsmr.apps@gmail.com",
// "id" = 3003332493073668,
// "name" = "Darwin Morocho",
// "picture" = {
// "data" = {
// "height" = 50,
// "is_silhouette" = 0,
// "url" = "https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=3003332493073668",
// "width" = 50,
// },
// }
// }

import 'package:tsf_intern/model/picture_model.dart';

class UserModel {
  final String? email;
  final String? id;
  final String? name;
  final PictureModel? pictureModel;

  const UserModel({this.email, this.id, this.name,this.pictureModel});

  factory UserModel.fromJson(Map<String,dynamic> json){
    return UserModel(
      email: json['email'],
      id: json['id'] as String?,
      name: json['name'],
      pictureModel: PictureModel.fromJson(json['picture']['data']),
    );
  }
}