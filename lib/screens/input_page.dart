import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hufsummer_hackathon/screens/naver_map.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';
import 'map_page.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int budget = 0;
  String university = "";
  final budgetController = TextEditingController();
  final universityController = TextEditingController();

  @override
  void dispose() {
    budgetController.dispose();
    universityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 100,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: SizedBox(
                    child: Text(
                      '  한끼에 얼마를 쓸까요?',
                      style: GoogleFonts.nanumGothic(
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 50),
                  child: Row(
                    children: [
                      Icon(
                        Icons.attach_money,
                        size: 30,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 250,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: budgetController,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: SizedBox(
                    child: Text(
                      '  어느 학교로 갈까요?',
                      style: GoogleFonts.nanumGothic(
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 50),
                  child: Row(
                    children: [
                      Icon(
                        Icons.school,
                        size: 30,
                        color: Colors.blueAccent,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 250,
                        child: TextField(
                          controller: universityController,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueAccent),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: SizedBox(
                    height: 50,
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
                      child: Text(
                        '확인',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {
                        // Check if the input values are valid before attempting to parse them
                        if (budgetController.text.isNotEmpty &&
                            universityController.text.isNotEmpty &&
                            int.tryParse(budgetController.text) != null) {

                          budget = int.parse(budgetController.text);
                          university = universityController.text;

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => NaverMapTest(
                                  budget: budget, university: university),
                            ),
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('입력 오류'),
                                content: Text('올바른 예산 및 대학 이름을 입력해주세요.'),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
