import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_basic/model/album.dart';
import 'package:http/http.dart' as http;

class AlbumProvider with ChangeNotifier {
  // List.empty(growable: true) - 리스트의 사이즈를 변형 시킬 수 있게 해준다.
  final List<Album> _albumList = List.empty(growable: true);

  List<Album> getAlbumList() {
    _fetchAlbum();
    return _albumList;
  }

  void _fetchAlbum() async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/albums"),
    );
    final List<Album> result = jsonDecode(response.body)
        .map<Album>((json) => Album.fromJson(json))
        .toList();
    _albumList.clear();
    _albumList.addAll(result);
    notifyListeners();
  }
}
