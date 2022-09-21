class PictureModel{
final String? url;
final int? width;
final int? height;

const PictureModel({this.url,this.width,this.height});

factory PictureModel.fromJson(Map<String,dynamic> json){
  return PictureModel(
    url: json['url'],
    width: json['width'],
    height: json['height'],

  );
}
}