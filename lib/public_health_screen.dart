import 'package:flutter/material.dart';

class PublicHealthScreen extends StatefulWidget {
  const PublicHealthScreen({super.key});

  @override
  State<PublicHealthScreen> createState() => _PublicHealthScreenState();
}

class _PublicHealthScreenState extends State<PublicHealthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Public Health Message Board")));
  }
}
