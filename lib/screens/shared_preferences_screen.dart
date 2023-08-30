import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesScreen extends StatefulWidget {
  const SharedPreferencesScreen({super.key});

  @override
  State<SharedPreferencesScreen> createState() =>
      _SharedPreferencesScreenState();
}

class _SharedPreferencesScreenState extends State<SharedPreferencesScreen> {
  late SharedPreferences _preferences;
  String _username = '';
  final TextEditingController usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getUsername();
  }

  _saveUsername() {
    setState(() {
      _username = usernameController.text;
      _preferences.setString('currentUsername', _username);
    });
  }

  _getUsername() async {
    _preferences = await SharedPreferences.getInstance();
    setState(() {
      _username = _preferences.getString('currentUsername') ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SharedPreferences'),
      ),
      body: Container(
        child: Column(
          children: [
            Text('현재 사용자 이름: $_username'),
            Container(
              child: TextField(
                controller: usernameController,
                textAlign: TextAlign.left,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: 'input username'),
              ),
            ),
            TextButton(
              onPressed: () => _saveUsername(),
              child: const Text('save'),
            ),
          ],
        ),
      ),
    );
  }
}
