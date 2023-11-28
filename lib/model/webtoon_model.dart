
class WebtoonModel {
  final String title, thumb, id;

  WebtoonModel.fromJson(Map<String,dynamic> json) : //생성자
  title = json['title'],
  thumb = json['thumb'],
  id = json['id'];

  //위랑 같다( 변수에 late)
  // WebtoonModel(Map<String,dynamic> json){
  //   title = json['title'];
  //   thumb = json['thumb'];
  //   id = json['id'];
  // }
}