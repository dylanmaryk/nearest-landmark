import 'package:location/location.dart';
import 'package:nearest_landmark/model/landmarks_response.dart';
import 'package:nearest_landmark/networking/landmarks_api_provider.dart';

class LandmarksInteractor {
  final LandmarksApiProvider landmarksApiProvider = LandmarksApiProvider();

  Future<LandmarksReponse> getLandmarks() {
    return _fetchLocation().then((locationData) => landmarksApiProvider.getLandmarks(locationData.latitude, locationData.longitude));
  }

  Future<LocationData> _fetchLocation() async {
    var location = new Location();
    try {
      return await location.getLocation();
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}