import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MapPage extends StatefulWidget {
  final int budget;
  final String university;

  const MapPage({Key? key, required this.budget, required this.university})
      : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
<<<<<<< HEAD
=======
  late String restaurant = 'restaurant';

>>>>>>> 형근
  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
<<<<<<< HEAD
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
=======
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                width: 1,
                color: Colors.black,
              ),
            ),
            height: 200,
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
>>>>>>> 형근
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
<<<<<<< HEAD

=======
>>>>>>> 형근
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
<<<<<<< HEAD
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
=======
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
>>>>>>> 형근
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
