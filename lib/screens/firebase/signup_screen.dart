import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _key = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUp"),
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
                submitButton(),
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

  ElevatedButton submitButton() {
    return ElevatedButton(
      onPressed: () async {
        if (_key.currentState!.validate()) {
          try {
            final credential = await FirebaseAuth.instance
                .createUserWithEmailAndPassword(
                    email: _emailController.text,
                    password: _passwordController.text)
                .then(
                  (_) => Navigator.pushNamed(context, '/'),
                );
          } on FirebaseAuthException catch (e) {
            if (e.code == 'weak-password') {
              debugPrint('too weak');
            } else if (e.code == 'email-already-in-use') {
              debugPrint('already-use');
            }
          }
        }
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        child: const Text('sign up'),
      ),
    );
  }
}
