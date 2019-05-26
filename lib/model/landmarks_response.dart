import 'landmark.dart';

class LandmarksReponse {
  final List<Landmark> landmarks;
  final String error;

  LandmarksReponse(this.landmarks, this.error);

  LandmarksReponse.fromJson(Map<String, dynamic> json)
    : landmarks = (json["landmarks"] as List).map((i) => new Landmark.fromJson(i)).toList(),
      error = "";

  LandmarksReponse.withError(String errorValue)
    : landmarks = List(),
      error = errorValue;
}
