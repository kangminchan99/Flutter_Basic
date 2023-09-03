import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/screens/firebase/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> user) {
        if (!user.hasData) {
          return const LoginScreen();
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text('home'),
              actions: [
                IconButton(
                  onPressed: () async => await FirebaseAuth.instance
                      .signOut()
                      // .then - 위의 작업(.signOut()이 성공적으로 끝나면 then다음 작업 수행)
                      .then((_) => Navigator.pushNamed(context, '/login')),
                  icon: const Icon(Icons.logout),
                ),
              ],
            ),
            body: const Center(
              child: Text('success login'),
            ),
          );
        }
      },
    );
  }
}
