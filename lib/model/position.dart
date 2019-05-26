class Position {
  final double lat;
  final double lng;

  Position(this.lat, this.lng);

  Position.fromJson(Map<String, dynamic> json)
    : lat = json["lat"],
      lng = json["lng"];
}
