import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myrsaapp/features/encriptionchat/model_Message.dart';
import 'package:shared_preferences/shared_preferences.dart';

class allMessages extends StatefulWidget {
  @override
  _allMessagesState createState() => _allMessagesState();
}

class _allMessagesState extends State<allMessages> {
  var roomID;

  void getRoomID() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      roomID = pref.getString('room');
    });
    print(roomID);
  }

  @override
  void initState() {
    getRoomID();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chat/rooms/' + roomID.toString())
            .orderBy('time', descending: true)
            .snapshots(),
        builder: (ctx, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final documents = streamSnapshot.data?.docs;
          var currId = FirebaseAuth.instance.currentUser?.uid;
          return documents != null
              ? ListView.builder(
                  reverse: true,
                  itemCount: streamSnapshot.data?.docs.length,
                  itemBuilder: (ctx, index) => ModelMessageBubble(
                      documents[index]['text'],
                      documents[index]['userId'] == currId,
                      documents[index]['userImage'],
                      documents[index]['time'].toDate(),
                      key: ValueKey(documents[index].id)))
              : Center(child: Text('No Messages in this room'));
        });
  }
}