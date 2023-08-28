import 'package:flutter/material.dart';

class GridViewScreen extends StatefulWidget {
  const GridViewScreen({super.key});

  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  final gridList = [
    {
      'number': 'sample title1',
      'color': Colors.green,
    },
    {
      'number': 'sample title2',
      'color': Colors.red,
    },
    {
      'number': 'sample title3',
      'color': Colors.yellow,
    },
    {
      'number': 'sample title4',
      'color': Colors.pink,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('GridView'),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          itemCount: gridList.length,
          itemBuilder: (BuildContext context, int index) {
            return girdItem(
                number: gridList[index]['number'] as String,
                choiceColor: gridList[index]['color'] as Color);
          },
        ));
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
