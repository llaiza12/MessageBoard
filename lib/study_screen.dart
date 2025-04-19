import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StudyScreen extends StatefulWidget {
  const StudyScreen({super.key});

  @override
  State<StudyScreen> createState() => _StudyScreenState();
}

class _StudyScreenState extends State<StudyScreen> {
  final TextEditingController _controller = TextEditingController();

  final CollectionReference _messages = FirebaseFirestore.instance.collection(
    'studymessages',
  );

  Future<void> addTask([DocumentSnapshot? documentSnapshot]) async {
    String userMsg = _controller.text;
    final user = FirebaseAuth.instance.currentUser;
    final displayName = user?.displayName ?? "Guest";

    setState(() {
      _messages.add({
        'message': userMsg,
        'name': displayName,
        'timestamp': FieldValue.serverTimestamp(),
      });
      _controller.clear();
    });
  }

  String _formatTimestamp(Timestamp? timestamp) {
    if (timestamp == null) return '';
    final date = timestamp.toDate();
    final time = TimeOfDay.fromDateTime(date);
    return time.format(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Study Message Board")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter Message',
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: addTask,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: StreamBuilder(
                stream: _messages.snapshots(),
                builder: (
                  context,
                  AsyncSnapshot<QuerySnapshot> streamSnapshot,
                ) {
                  if (streamSnapshot.hasData) {
                    return ListView.builder(
                      itemCount: streamSnapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot documentSnapshot =
                            streamSnapshot.data!.docs[index];
                        return ListTile(
                          title: Text(documentSnapshot['message']),
                          subtitle: Text(documentSnapshot['name'] ?? "Guest"),
                          trailing: Text(
                            _formatTimestamp(documentSnapshot['timestamp']),
                          ),
                        );
                      },
                    );
                  }
                  return Center(child: Text("No Messages"));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
