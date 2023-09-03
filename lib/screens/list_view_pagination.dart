import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListViewPaginationScreen extends StatefulWidget {
  const ListViewPaginationScreen({super.key});

  @override
  State<ListViewPaginationScreen> createState() =>
      _ListViewPaginationScreenState();
}

class _ListViewPaginationScreenState extends State<ListViewPaginationScreen> {
  final _url = "https://jsonplaceholder.typicode.com/albums";
  int _page = 1;
  final int _limit = 20;
  bool _hasNextPage = true;
  bool _isFirstLoadRunning = false;
  bool _isLoadMoreRunning = false;
  List _albumList = [];
  late ScrollController _scrollController;

  void _update() => setState(() {});

  @override
  void initState() {
    super.initState();
    _initLoad();
    _scrollController = ScrollController()..addListener(_nextLoad);
  }

  void _initLoad() async {
    _update();
    _isFirstLoadRunning = true;

    try {
      final res = await http.get(Uri.parse("$_url?_page=$_page&limit=$_limit"));
      _update();
      _albumList = jsonDecode(res.body);
    } catch (e) {
      print(e.toString());
    }

    _update();
    _isFirstLoadRunning = false;
  }

  void _nextLoad() async {
    if (_hasNextPage &&
        !_isFirstLoadRunning &&
        !_isLoadMoreRunning &&
        _scrollController.position.extentAfter < 100) {
      _update();
      _isLoadMoreRunning = true;
      _page += 1;
      try {
        final res =
            await http.get(Uri.parse("$_url?_page=$_page&limit=$_limit"));
        final List fetchedAlbums = json.decode(res.body);
        if (fetchedAlbums.isNotEmpty) {
          _update();
          _albumList.addAll(fetchedAlbums);
        } else {
          _update();
          _hasNextPage = false;
        }
      } catch (e) {
        print(e.toString());
      }

      _update();
      _isLoadMoreRunning = false;
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_nextLoad);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListViewPagination"),
      ),
      body: _isFirstLoadRunning
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: _albumList.length,
                    itemBuilder: (context, index) => Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 10),
                      child: ListTile(
                        title: Text(_albumList[index]['id'].toString()),
                        subtitle: Text(_albumList[index]['title']),
                      ),
                    ),
                  ),
                ),
                if (_isLoadMoreRunning == true)
                  Container(
                    padding: const EdgeInsets.all(30),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                if (_hasNextPage == false)
                  Container(
                    padding: const EdgeInsets.all(20),
                    color: Colors.blue,
                    child: const Text('no more data to be fetched'),
                  ),
              ],
            ),
    );
  }
}
