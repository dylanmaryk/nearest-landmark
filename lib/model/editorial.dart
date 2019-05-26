import 'via.dart';

class Editorial {
  final String description;
  final Via via;
  final String attribution;

  Editorial(this.description, this.via, this.attribution);

  Editorial.fromJson(Map<String, dynamic> json)
    : description = json["description"],
      via = Via.fromJson(json["via"]),
      attribution = json["attribution"];
}
