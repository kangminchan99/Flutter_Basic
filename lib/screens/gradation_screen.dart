import 'package:flutter/material.dart';

class GradationScreen extends StatefulWidget {
  const GradationScreen({super.key});

  @override
  State<GradationScreen> createState() => _GradationScreenState();
}

class _GradationScreenState extends State<GradationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gradation'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //   colors: [
          //     Colors.blue[100] as Color,
          //     Colors.blue[300] as Color,
          //     Colors.blue[500] as Color,
          //   ],
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   stops: const [0.1, 0.4, 0.7],
          // ),
          gradient: RadialGradient(
              center: Alignment.center,
              colors: [
                Colors.blue[100] as Color,
                Colors.blue[300] as Color,
                Colors.blue[500] as Color,
              ],
              stops: const [0.1, 0.2, 0.3],
              radius: 1),
        ),
      ),
    );
  }
}
