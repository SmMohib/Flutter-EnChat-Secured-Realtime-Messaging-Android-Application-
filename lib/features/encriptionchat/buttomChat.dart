import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myrsaapp/common/utils/colors.dart';
import 'package:myrsaapp/common/utils/textStyle.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ButtomChats extends StatefulWidget {
  @override
  _ButtomChatsState createState() => _ButtomChatsState();
}

class _ButtomChatsState extends State<ButtomChats> {
  var _enteredMessage;
  final _controller = new TextEditingController();
  Color button = Color(0xff125589);

  void _sendMessage() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    SharedPreferences pref = await SharedPreferences.getInstance();
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser?.uid)
        .get();
    FocusScope.of(context).unfocus();
    FirebaseFirestore.instance
        .collection('chat/rooms/${pref.getString('room')}')
        .add({
      'text': _enteredMessage,
      'time': DateTime.now(),
      'userId': auth.currentUser!.uid,
      'userImage': userData['profilePic'],
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: text16(),
              keyboardType: TextInputType.text,
              controller: _controller,
              cursorColor: button,
              decoration: InputDecoration(
                hintText: 'Send Message',
                hintStyle: TextStyle(color: appBarColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _enteredMessage = value;
                });
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, color: appBarColor),
            onPressed: _enteredMessage.toString().trim().isEmpty
                ? null
                : () {
                    _sendMessage();
                  },
          ),
        ],
      ),
    );
  }
}
