import 'package:flutter/material.dart';
import 'games_screen.dart';
import 'business_screen.dart';
import 'public_health_screen.dart';
import 'study_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Message Board',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const MyHomePage(title: 'Message Board'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Center(child: Text(widget.title)),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: const Color.fromARGB(255, 228, 255, 232),
            height: 100,
            child: ListTile(
              title: Center(
                child: Text(
                  "Games",
                  style: TextStyle(fontSize: 30, color: Colors.blue),
                ),
              ),
              leading: Icon(Icons.gamepad, color: Colors.green, size: 30),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GamesScreen()),
                );
              },
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 255, 253, 230),
            height: 100,
            child: ListTile(
              title: Center(
                child: Text(
                  "Business",
                  style: TextStyle(fontSize: 30, color: Colors.blue),
                ),
              ),
              leading: Icon(Icons.attach_money, color: Colors.yellow, size: 30),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BusinessScreen(),
                  ),
                );
              },
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 255, 232, 232),
            height: 100,
            child: ListTile(
              title: Center(
                child: Text(
                  "Public Health",
                  style: TextStyle(fontSize: 30, color: Colors.blue),
                ),
              ),
              leading: Icon(
                Icons.health_and_safety,
                color: Colors.red,
                size: 30,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PublicHealthScreen(),
                  ),
                );
              },
            ),
          ),
          Container(
            height: 100,
            color: const Color.fromARGB(255, 223, 241, 255),
            child: ListTile(
              title: Center(
                child: Text(
                  "Study",
                  style: TextStyle(fontSize: 30, color: Colors.blue),
                ),
              ),
              leading: Icon(Icons.book, color: Colors.blue, size: 30),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StudyScreen()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
