import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView'),
      ),
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          listViewItem(),
          listViewItem(title: '1', choiceColor: Colors.yellow),
          listViewItem(title: '2', choiceColor: Colors.blue),
          listViewItem(title: '33', choiceColor: Colors.pink),
        ],
      ),
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
