import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Firestore.instance
            .collection('chats/aWrd42QTbXe4ful9fiPP/messages')
            .snapshots(),
        builder: (ctx, streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          //   final documents = streamSnapshot.data.documents;
          return ListView.builder(
            itemCount: 10,
            itemBuilder: (ctx, index) => Container(
              padding: EdgeInsets.all(8),
              // child: Text(documents[index]['text']),
              child: Text('text'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Firestore.instance
              .collection('chats/aWrd42QTbXe4ful9fiPP/messages')
              .snapshots()
              .listen((event) {
            // ignore: avoid_print
            event.documents.forEach((document) {
              print(document['text']);
            });
          });
          //.add({'text': 'This was added by clicking the button!'});
        },
      ),
    );
  }
}
