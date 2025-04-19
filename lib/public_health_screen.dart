import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PublicHealthScreen extends StatefulWidget {
  const PublicHealthScreen({super.key});

  @override
  State<PublicHealthScreen> createState() => _PublicHealthScreenState();
}

class _PublicHealthScreenState extends State<PublicHealthScreen> {
  final TextEditingController _controller = TextEditingController();

  final CollectionReference _messages = FirebaseFirestore.instance.collection(
    'healthmessages',
  );

  Future<void> addTask([DocumentSnapshot? documentSnapshot]) async {
    String userMsg = _controller.text;
    setState(() {
      _messages.add({'message': userMsg});
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Public Health Message Board")),
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
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () async {
                              FirebaseFirestore.instance
                                  .collection('healthmessages')
                                  .doc(documentSnapshot.id)
                                  .delete();
                            },
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
