class Via {
  final String href;

  Via(this.href);

  Via.fromJson(Map<String, dynamic> json)
    : href = json["href"];
}
