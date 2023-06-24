import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
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

  late String restaurant = 'restaurant';

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 50),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                width: 1,
                color: Colors.black,
              ),
            ),
            // padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            height: 170,
            child: Column(
              children: [
                Text(
                  '${restaurant}',
                  style: GoogleFonts.urbanist(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black
                  ),
                ),
              ],
            ),
          ),
        );
      },

      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          child: NaverMap(
            onMapCreated: onMapCreated,
            mapType: _mapType,
            initialCameraPosition: CameraPosition(
              target: LatLng(37.5665, 126.9780),
              // 서울의 위도(latitude)와 경도(longitude) 좌표
              zoom: 13.0, // 초기 줌 레벨
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
          child: TextButton(
            style: ButtonStyle(
              backgroundColor:
              MaterialStateProperty.all<Color>(Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.black)),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  '${widget.university}의 ${widget.budget}원 식사',
                  style: GoogleFonts.urbanist(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                )
              ],
            ),
          ),
        ),

      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: _showBottomSheet,
        child: Icon(Icons.add),
      ),
    );
  }

  void onMapCreated(NaverMapController controller) {
    if (_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
  }
}