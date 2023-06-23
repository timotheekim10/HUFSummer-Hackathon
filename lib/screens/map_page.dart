import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {

  final int budget;
  final int university;


  const MapPage({Key? key, required this.budget, required this.university}) : super(key: key);


  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}