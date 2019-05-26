import 'package:dio/dio.dart';
import 'package:nearest_landmark/model/landmarks_response.dart';

class LandmarksApiProvider {
  final String endpoint = "https://nearest-landmark.v2.vapor.cloud/landmarks?lat=52.5200&lng=13.4050";
  final Dio dio = Dio();

  Future<LandmarksReponse> getLandmarks() async {
    try {
      Response response = await dio.get(endpoint);
      return LandmarksReponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return LandmarksReponse.withError("$error");
    }
  }
}
