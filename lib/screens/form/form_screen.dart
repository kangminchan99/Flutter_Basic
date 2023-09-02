import 'package:flutter/material.dart';
import 'package:flutter_basic/model/user.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _key = GlobalKey<FormState>();
  late String _username, _email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Form(
          key: _key,
          child: Column(
            children: [
              usernameInput(),
              const SizedBox(height: 15),
              emailInput(),
              const SizedBox(height: 15),
              submitBtn(),
            ],
          ),
        ),
      ),
    );
  }

  Widget usernameInput() {
    return TextFormField(
      autofocus: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'The input is empty';
        } else {
          return null;
        }
      },
      onSaved: (username) => _username = username as String,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'input name',
        labelText: 'username',
      ),
    );
  }

  Widget emailInput() {
    return TextFormField(
      autofocus: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'The input is empty';
        } else {
          return null;
        }
      },
      onSaved: (email) => _email = email as String,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'input email',
        labelText: 'email',
      ),
    );
  }

  Widget submitBtn() {
    return ElevatedButton(
      onPressed: () {
        if (_key.currentState!.validate()) {
          _key.currentState!.save();
          Navigator.pushNamed(
            context,
            '/success',
            arguments: User(_username, _email),
          );
        }
      },
      child: const Text('제출'),
    );
  }
}
