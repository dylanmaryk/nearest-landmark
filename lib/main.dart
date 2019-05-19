import 'package:flutter/material.dart';

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
  _NearestLandmarkHomePageState createState() => new _NearestLandmarkHomePageState();
}

class _NearestLandmarkHomePageState extends State<NearestLandmarkHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
    );
  }
}
