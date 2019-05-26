import 'package:flutter/material.dart';
import 'package:nearest_landmark/model/landmarks_response.dart';
import 'package:nearest_landmark/networking/landmarks_api_provider.dart';

void main() => runApp(new NearestLandmarkApp());

class NearestLandmarkApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'NearestLandmark',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new NearestLandmarkHomePage(title: 'NearestLandmark'),
    );
  }
}

class NearestLandmarkHomePage extends StatefulWidget {
  NearestLandmarkHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NearestLandmarkHomePageState createState() =>
      new _NearestLandmarkHomePageState();
}

class _NearestLandmarkHomePageState extends State<NearestLandmarkHomePage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<LandmarksReponse>(
      stream: LandmarksApiProvider().getLandmarks().asStream(),
      builder: (context, AsyncSnapshot<LandmarksReponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return buildErrorWidget(snapshot.data.error);
          }
          return buildUserWidget(snapshot.data);
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
      children: [Text("Loading data from API..."), CircularProgressIndicator()],
    ));
  }

  Widget buildErrorWidget(String error) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Error occured: $error"),
      ],
    ));
  }

  Widget buildUserWidget(LandmarksReponse data) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("landmarks response widget"),
      ],
    ));
  }
}
