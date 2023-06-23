import 'package:flutter/material.dart';
import 'package:projects/screens/map_page.dart';

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
    return Column(
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
              backgroundColor: Colors.green,
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
                    builder: (_) => MapPage(budget: budget, university: university),
                  ),
                );
              } catch (e) {
                print("Error: 입력값이 옳지 않음");
              }
            },
          ),
        ),
      ],
    );
  }
}