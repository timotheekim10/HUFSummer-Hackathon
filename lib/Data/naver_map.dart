import 'dart:async';

import 'package:flutter/material.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class NaverMapTest extends StatefulWidget {

  final int budget;
  final String university;

  const NaverMapTest({Key? key, required this.budget, required this.university})
      : super(key: key);
  @override
  _NaverMapTestState createState() => _NaverMapTestState();
}

class _NaverMapTestState extends State<NaverMapTest> {
  Completer<NaverMapController> _controller = Completer();
  MapType _mapType = MapType.Basic;

  List<Marker> markers = [Marker(markerId: 'test1', position: LatLng(37.5665, 126.9780)),Marker(markerId: 'test2', position: LatLng(37.5665, 126.9750)), Marker(markerId: 'test3', position: LatLng(37.5665, 126.9860))];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: NaverMap(
          onMapCreated: onMapCreated,
          mapType: _mapType,
          initialCameraPosition: CameraPosition(
            target: LatLng(37.5665, 126.9780), // 서울의 위도(latitude)와 경도(longitude) 좌표
            zoom: 13.0, // 초기 줌 레벨
          ),
          markers: markers,
        ),
      ),
    );
  }

  void onMapCreated(NaverMapController controller) {
    if (_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
  }
}