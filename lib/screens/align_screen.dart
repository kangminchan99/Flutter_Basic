import 'package:flutter/material.dart';

class AlignScreen extends StatefulWidget {
  const AlignScreen({super.key});

  @override
  State<AlignScreen> createState() => _AlignScreenState();
}

class _AlignScreenState extends State<AlignScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Align'),
      ),
      body: Container(
        // Stack으로 감싸면 화면전체에서 Column으로 감싸면 순차적으로
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.black26,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                color: Colors.brown,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                margin: const EdgeInsets.only(left: 40, bottom: 150),
                width: 100,
                height: 100,
                color: Colors.yellow,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: const EdgeInsets.only(bottom: 200),
                width: 200,
                height: 70,
                color: Colors.lightBlue,
              ),
            ),
            // Align(
            //   alignment: Alignment.bottomRight,
            //   child: Container(
            //     width: 100,
            //     height: 100,
            //     // Alignment.center - 컨테이너 내부의 alignment는 컨테이너 내부에서 센터를 의미한다.
            //     alignment: Alignment.center,
            //     color: Colors.green,
            //     child: const Text('hi'),
            //   ),
            // ),
            // Align(
            //   alignment: Alignment.topCenter,
            //   child: Container(
            //     width: 100,
            //     height: 100,
            //     // Alignment.center - 컨테이너 내부의 alignment는 컨테이너 내부에서 센터를 의미한다.
            //     alignment: Alignment.center,
            //     color: Colors.blue,
            //     child: const Text('hi'),
            //   ),
            // ),
            // Align(
            //   alignment: Alignment.center,
            //   child: Container(
            //     width: 100,
            //     height: 100,
            //     // Alignment.center - 컨테이너 내부의 alignment는 컨테이너 내부에서 센터를 의미한다.
            //     alignment: Alignment.center,
            //     color: Colors.green,
            //     child: const Text('hi'),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
