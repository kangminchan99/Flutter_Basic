import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/model/product.dart';

class RefreshIndicatorScreen extends StatefulWidget {
  const RefreshIndicatorScreen({super.key});

  @override
  State<RefreshIndicatorScreen> createState() => _RefreshIndicatorScreenState();
}

class _RefreshIndicatorScreenState extends State<RefreshIndicatorScreen> {
  late Future<List<Product>> productList;
  Dio dio = Dio();

  @override
  void initState() {
    super.initState();
    productList = getProductData();
  }

  Future<List<Product>> getProductData() async {
    late List<Product> products;
    try {
      var response = await dio.get("https://dummyjson.com/products");
      products = response.data['products']
          .map<Product>((json) => Product.fromJson(json))
          .toList();
      print('refreshed');
    } catch (e) {
      print(e);
    }
    return products;
  }

  Future<void> refreshData() async {
    productList = getProductData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RefreshIndicator'),
      ),
      body: RefreshIndicator(
        onRefresh: () => refreshData(),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: FutureBuilder<List<Product>>(
            future: productList,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                );
              } else {
                // shrinkWrap: true - 데이터가 없을경우 리스트뷰의 크기를 늘리지 않음
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    var data = snapshot.data[index];
                    return Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black87),
                      ),
                      child: Text('${data.title}(${data.description})'),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
