import 'package:flutter/material.dart';
import 'package:hufsummer_hackathon/Data/naver_map.dart';
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    controller: budgetController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '예산',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    controller: universityController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '대학',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                  ),
                  child: Text(
                    '확인',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    try {
                      budget = int.parse(budgetController.text);
                      university = universityController.text;
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => NaverMapTest(
                              budget: budget, university: university),
                        ),
                      );
                    } catch (e) {
                      print("Error: 입력값이 옳지 않음");
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
