import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {
  final int budget;
  final String university;

  const MapPage({Key? key, required this.budget, required this.university})
      : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 40),
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.green,
            ),
            child: Center(
              child: Text(
                '식당이름',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color(0xff8BC34A),
                ),
              ),
            ),
          ),
        );
      },
      barrierColor: Colors.transparent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              child: Container(
                height: 40,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xff8BC34A),

                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    '${widget.budget}원으로 먹을 수 있는 ${widget.university} 근처 식당',
                    style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showBottomSheet,
        child: Icon(Icons.add),
      ),
    );
  }
}