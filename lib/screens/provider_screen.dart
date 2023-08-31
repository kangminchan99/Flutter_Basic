import 'package:flutter/material.dart';
import 'package:flutter_basic/model/album.dart';
import 'package:flutter_basic/provider/album_provider.dart';
import 'package:provider/provider.dart';

class ProviderScreen extends StatefulWidget {
  const ProviderScreen({super.key});

  @override
  State<ProviderScreen> createState() => _ProviderScreenState();
}

class _ProviderScreenState extends State<ProviderScreen> {
  late List<Album> albumList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: Consumer<AlbumProvider>(
        builder: (context, provider, child) {
          albumList = provider.getAlbumList();

          return ListView.builder(
            itemCount: albumList.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(15),
                child:
                    Text('${albumList[index].id}: ${albumList[index].title}'),
              );
            },
          );
        },
      ),
    );
  }
}
