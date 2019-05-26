import 'editorial.dart';
import 'image.dart';
import 'position.dart';

class Landmark {
  final Position position;
  final int distance;
  final String title;
  final List<Image> images;
  final Editorial editorial;

  Landmark(this.position, this.distance, this.title, this.images, this.editorial);

  Landmark.fromJson(Map<String, dynamic> json)
    : position = Position.fromJson(json["position"]),
      distance = json["distance"],
      title = json["title"],
      images = (json["images"] as List).map((i) => new Image.fromJson(i)).toList(),
      editorial = json.containsKey("editorial") ? Editorial.fromJson(json["editorial"]) : null;
}
