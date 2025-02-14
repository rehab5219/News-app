class Article{
  String? title;
  String? image;
  String? description;
  String? publishAt;

  Article({this.title, this.image, this.description, this.publishAt});

  Article.fromJson(Map<String, dynamic> json){
    title = json['title'];
    image = json['urlToImage'];
    description = json['description'];
    publishAt = json['publishAt'];
  }
}