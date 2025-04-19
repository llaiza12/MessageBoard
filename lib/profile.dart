import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _nameController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  String? _username;

  @override
  void initState() {
    super.initState();
    final user = _auth.currentUser;
    _username = user?.displayName ?? '';
  }

  void _changeName() async {
    final newName = _nameController.text;
    final user = _auth.currentUser;

    await user?.updateDisplayName(newName);
    setState(() {
      _username = user?.displayName;
    });
    _showMessage("Display name updated successfully");
  }

  void _showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Display Name: $_username', style: TextStyle(fontSize: 25)),
            const SizedBox(height: 10),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Change display name',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: _changeName, child: const Text('Save')),
          ],
        ),
      ),
    );
  }
}
