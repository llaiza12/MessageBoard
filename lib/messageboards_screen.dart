import 'package:flutter/material.dart';
import 'games_screen.dart';
import 'business_screen.dart';
import 'public_health_screen.dart';
import 'study_screen.dart';

class MessageboardsScreen extends StatefulWidget {
  const MessageboardsScreen({super.key, required this.title});
  final String title;

  @override
  State<MessageboardsScreen> createState() => _MessageboardsScreenState();
}

class _MessageboardsScreenState extends State<MessageboardsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: ListView(
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
                    MaterialPageRoute(
                      builder: (context) => const GamesScreen(),
                    ),
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
                leading: Icon(
                  Icons.attach_money,
                  color: Colors.yellow,
                  size: 30,
                ),
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
                    MaterialPageRoute(
                      builder: (context) => const StudyScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
