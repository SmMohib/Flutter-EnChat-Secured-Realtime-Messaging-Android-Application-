// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, avoid_unnecessary_containers

// ignore: unnecessary_import
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myrsaapp/Screens/feedbacks.dart';
import 'package:myrsaapp/common/utils/colors.dart';
import 'package:myrsaapp/common/utils/textStyle.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final currentUser = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Profile'),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('users')
                .where('uid', isEqualTo: currentUser.currentUser!.uid)
                .snapshots(),
            builder: ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: ((context, index) {
                      var data = snapshot.data!.docs[index];
                      return Column(children: [
                        Stack(
                          children: [
                            Container(
                              color: buttonColor,
                              width: double.infinity,
                              child: Image.network(data['profilePic']),
                            ),
                            Positioned(
                                right: 10,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.edit,
                                    color: whiteColor,
                                  ),
                                )),
                          ],
                        ),
                        Container(
                            height: 50.0,
                            child: Padding(
                              padding: EdgeInsets.all(0.0),
                              child: ListTile(
                                title: Text(
                                  data['name'],
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: blackColor,
                                      fontWeight: FontWeight.w600),
                                ),
                                subtitle: Text(
                                  'User name',
                                  style: TextStyle(color: textColor),
                                ),
                              ),
                            )),
                        Container(
                            height: 50.0,
                            child: Padding(
                              padding: EdgeInsets.all(0.0),
                              child: ListTile(
                                title: Text(
                                  data['phoneNumber'],
                                  style: text16(),
                                ),
                                subtitle: Text(
                                  'Your Number',
                                  style: TextStyle(color: textColor),
                                ),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                              height: 50.0,
                              child: const Padding(
                                padding: EdgeInsets.all(0.0),
                                child: ListTile(
                                  title: Text(
                                    "Bio",
                                    style: TextStyle(
                                        fontSize: 18, color: textColor),
                                  ),
                                  subtitle: Text(
                                    'Hi.. ',
                                    style: TextStyle(color: textColor),
                                  ),
                                ),
                              )),
                        ),
                        Divider(
                          color: dividerColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              ListTile(
                                onTap: () {},
                                leading: const Icon(
                                  Icons.notifications,
                                  color: dividerColor,
                                ),
                                title: Text(
                                  "Notification and Sound",
                                  style: text20(),
                                ),
                              ),
                              ListTile(
                                onTap: () {},
                                leading: const Icon(
                                  Icons.lock,
                                  color: dividerColor,
                                ),
                                title: Text(
                                  "Privacy & Security",
                                  style: text20(),
                                ),
                              ),
                              ListTile(
                                onTap: () {},
                                leading: const Icon(
                                  Icons.chat,
                                  color: dividerColor,
                                ),
                                title: Text(
                                  "Chat Setting",
                                  style: text20(),
                                ),
                              ),
                              ListTile(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              FeedbackPage())));
                                },
                                leading: const Icon(
                                  Icons.question_answer,
                                  color: dividerColor,
                                ),
                                title: Text(
                                  " Feedback",
                                  style: text20(),
                                ),
                              ),
                              ListTile(
                                onTap: () {},
                                leading: const Icon(
                                  Icons.policy,
                                  color: dividerColor,
                                ),
                                title: Text(
                                  "Privacy & Policy",
                                  style: text20(),
                                ),
                              ),
                              ListTile(
                                onTap: () {},
                                leading: const Icon(
                                  Icons.block,
                                  color: dividerColor,
                                ),
                                title: Text(
                                  "Bloked",
                                  style: text20(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]);
                    }));
              } else {
                return CircularProgressIndicator();
              }
            })),
      ),
    );
  }
}
