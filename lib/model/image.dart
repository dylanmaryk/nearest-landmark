class Image {
  final String src;
  final String attribution;

  Image(this.src, this.attribution);

  Image.fromJson(Map<String, dynamic> json)
    : src = json["src"],
      attribution = json["attribution"];
}
