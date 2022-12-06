import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myrsaapp/common/utils/colors.dart';
import 'package:myrsaapp/common/utils/textStyle.dart';
import 'package:myrsaapp/features/chatroom/joinRoom.dart';
import 'package:myrsaapp/features/encriptionchat/all_message.dart';
import 'package:myrsaapp/features/encriptionchat/buttomChat.dart';
import 'package:myrsaapp/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatPages extends StatefulWidget {
  ChatPages(
    
      );
      
       // get userImage => null;

  String? userImage ;
 
  @override
  _ChatPagesState createState() => _ChatPagesState();
}

class _ChatPagesState extends State<ChatPages> {
  var roomID;
  Color appBar = Color(0xff125589);
  Color back = Color(0xffffffff);

  void logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove('token');
    FirebaseAuth.instance.signOut();
    print('logout');
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => AuthScreen()),
    // );
  }

  void room() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => JoinRoom()),
    );
  }

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
    return Scaffold(
      backgroundColor: back,
      appBar: AppBar(
        elevation: 10,
        backgroundColor: appBarColor,
        title: Text(
          'Private Key : ' + roomID.toString(),
          style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255), fontSize: 17),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                main();
             // print(widget.message);
               // secure = !secure;
              });
            },
            child: CircleAvatar(
              backgroundImage: widget.userImage != null
                  ? NetworkImage(widget.userImage!)
                 : NetworkImage(
                     'https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/boy_male_avatar_portrait-512.png'),
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          DropdownButton(
            onChanged: (item) {
              if (item == 'logout') {
                logout();
              }
              if (item == 'room') {
                room();
              }
            },
            // ignore: prefer_const_constructors
            icon: Icon(
              Icons.more_vert,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            items: [
              DropdownMenuItem(
                // ignore: sort_child_properties_last
                child: Row(
                  children: [
                    // ignore: prefer_const_constructors
                    Icon(
                      Icons.exit_to_app,
                      color: blackColor,
                    ),
                    SizedBox(width: 25),
                    Text(
                      'Logout',
                      style: text16(),
                    ),
                  ],
                ),
                value: 'logout',
              ),
              DropdownMenuItem(
                child: Row(
                  children: [
                    Icon(
                      Icons.home,
                      color: blackColor,
                    ),
                    SizedBox(width: 25),
                    Text(
                      'Home',
                      style: text16(),
                    ),
                  ],
                ),
                value: 'Home',
              ),
            ],
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Expanded(child: allMessages()),
            // NewMessages(),
            ButtomChats()
          ],
        ),
      ),
    );
  }
}
