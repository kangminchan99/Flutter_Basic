import 'package:flutter/material.dart';

class GridViewScreen extends StatefulWidget {
  const GridViewScreen({super.key});

  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView'),
      ),
      body: GridView(
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          // crossAxisSpacing - 열 사이의 공백을 나타냄.
          crossAxisSpacing: 15,
          // mainAxisSpacing - 행 사이의 공백을 나타냄.
          mainAxisSpacing: 15,
        ),
        children: [
          girdItem(number: '1', choiceColor: Colors.red),
          girdItem(number: '2', choiceColor: Colors.pink),
          girdItem(number: '3', choiceColor: Colors.yellow),
          girdItem(number: '4', choiceColor: Colors.green),
          girdItem(number: '5', choiceColor: Colors.green),
          girdItem(number: '6', choiceColor: Colors.green),
          girdItem(number: '7', choiceColor: Colors.green),
          girdItem(number: '8', choiceColor: Colors.green),
          girdItem(number: '9', choiceColor: Colors.green),
          girdItem(number: '10', choiceColor: Colors.green),
          girdItem(number: '11', choiceColor: Colors.green),
        ],
      ),
    );
  }

  Widget girdItem({String number = '0', Color choiceColor = Colors.blue}) {
    return Container(
      color: choiceColor,
      child: Center(
        child: Text('Box $number'),
      ),
    );
  }
}
