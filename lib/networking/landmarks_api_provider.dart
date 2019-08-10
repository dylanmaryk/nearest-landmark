import 'package:dio/dio.dart';
import 'package:nearest_landmark/model/landmarks_response.dart';

class LandmarksApiProvider {
  final Dio dio = Dio();

  Future<LandmarksReponse> getLandmarks(double lat, double lng) async {
    try {
      String endpoint = "https://nearest-landmark.v2.vapor.cloud/landmarks?lat=$lat&lng=$lng";
      Response response = await dio.get(endpoint);
      return LandmarksReponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return LandmarksReponse.withError("$error");
    }
  }
}
