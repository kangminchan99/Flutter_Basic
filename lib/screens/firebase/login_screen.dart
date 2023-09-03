import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _key = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Form(
            key: _key,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                emailInput(),
                const SizedBox(height: 15),
                passwordInput(),
                const SizedBox(height: 15),
                loginButton(),
                const SizedBox(height: 15),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/signup'),
                  child: const Text('sign up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField emailInput() {
    return TextFormField(
      controller: _emailController,
      autofocus: true,
      validator: (val) {
        if (val!.isEmpty) {
          return 'input empty';
        } else {
          return null;
        }
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'input email',
      ),
    );
  }

  TextFormField passwordInput() {
    return TextFormField(
      controller: _passwordController,
      autofocus: true,
      obscureText: true,
      validator: (val) {
        if (val!.isEmpty) {
          return 'input empty';
        } else {
          return null;
        }
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'input password',
      ),
    );
  }

  ElevatedButton loginButton() {
    return ElevatedButton(
      onPressed: () async {
        if (_key.currentState!.validate()) {
          try {
            await FirebaseAuth.instance
                .signInWithEmailAndPassword(
                    email: _emailController.text,
                    password: _passwordController.text)
                .then(
                  (_) => Navigator.pushNamed(context, '/'),
                );
          } on FirebaseAuthException catch (e) {
            if (e.code == 'user-not-found') {
              debugPrint('no user found for that email');
            } else if (e.code == 'wrong-password') {
              debugPrint('wrong password');
            }
          }
        }
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        child: const Text('login'),
      ),
    );
  }
}
