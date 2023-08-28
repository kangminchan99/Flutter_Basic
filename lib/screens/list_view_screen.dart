import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  final postList = [
    {
      'title': 'sample title1',
      'color': Colors.green,
    },
    {
      'title': 'sample title2',
      'color': Colors.red,
    },
    {
      'title': 'sample title3',
      'color': Colors.yellow,
    },
    {
      'title': 'sample title4',
      'color': Colors.pink,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView'),
      ),
      body: ListView.builder(
          itemCount: postList.length,
          itemBuilder: (BuildContext context, int index) {
            return listViewItem(
              title: postList[index]['title'] as String,
              choiceColor: postList[index]['color'] as Color,
            );
          }),
    );
  }

  Widget listViewItem(
      {String title = 'null is me', Color choiceColor = Colors.black}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: Text(title),
        ),
        Container(
          width: 200,
          height: 200,
          color: choiceColor,
        ),
      ],
    );
  }
}
