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
        builder: (ctx, AsyncSnapshot<QuerySnapshot> streamSnapsho) {
          if (!streamSnapsho.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final documents = streamSnapsho.data!.documents;

          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (ctx, index) => Container(
              padding: EdgeInsets.all(8),
              child: Text(documents[index]['text']),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Firestore.instance
              .collection('chats/aWrd42QTbXe4ful9fiPP/messages')
              .add({'text': 'this add by click button'});
          //.add({'text': 'This was added by clicking the button!'});
        },
      ),
    );
  }
}
