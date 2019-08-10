import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:nearest_landmark/interactor/landmarks_interactor.dart';
import 'package:nearest_landmark/model/landmarks_response.dart';

import 'model/landmark.dart';

void main() => runApp(new NearestLandmarkApp());

class NearestLandmarkApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new NearestLandmarkHomePage(),
    );
  }
}

class NearestLandmarkHomePage extends StatefulWidget {
  NearestLandmarkHomePage({Key key}) : super(key: key);

  @override
  _NearestLandmarkHomePageState createState() =>
      new _NearestLandmarkHomePageState();
}

class _NearestLandmarkHomePageState extends State<NearestLandmarkHomePage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<LandmarksReponse>(
      stream: LandmarksInteractor().getLandmarks().asStream(),
      builder: (context, AsyncSnapshot<LandmarksReponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return buildErrorWidget(snapshot.data.error);
          }
          return buildLandmarkWidget(snapshot.data.landmarks);
        } else if (snapshot.hasError) {
          return buildErrorWidget(snapshot.error);
        } else {
          return buildLoadingWidget();
        }
      },
    );
  }

  Widget buildLoadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Loading data from API..."),
          CircularProgressIndicator(),
        ],
      ),
    );
  }

  Widget buildErrorWidget(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Error occured: $error"),
        ],
      ),
    );
  }

  Widget buildLandmarkWidget(List<Landmark> landmarks) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Stack(
          children: <Widget>[
            Image.network(
              landmarks[index].images.first.src,
              fit: BoxFit.fitHeight,
            ),
            Positioned(
              child: Container(
                child: Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(10)),
                    Flexible(
                      child: Column(
                        children: <Widget>[
                          Text(landmarks[index].title),
                          Padding(padding: EdgeInsets.all(50)),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                  ],
                ),
                color: Colors.white,
              ),
              bottom: 0,
              left: 0,
              right: 0,
            ),
          ],
          fit: StackFit.expand,
        );
      },
      itemCount: landmarks.length,
      loop: false,
      pagination: SwiperPagination(),
    );
  }
}
