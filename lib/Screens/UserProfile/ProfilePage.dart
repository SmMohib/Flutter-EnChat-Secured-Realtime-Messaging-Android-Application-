import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myrsaapp/common/utils/colors.dart';
import 'package:myrsaapp/common/utils/textStyle.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({
    Key? key,
  }) : super(key: key);
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;

  final Stream<DocumentSnapshot> documentStream =
      FirebaseFirestore.instance.collection('users').doc('name').snapshots();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //     body: StreamBuilder<DocumentSnapshot>(
        //   stream: documentStream,
        //   builder:
        //       (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        //     if (snapshot.hasError) {
        //       return Text('Something went wrong');

        //     }

        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return Text("Loading");
        //     }

        //     return Column(
        //       children: [

        //       ],
        //     );
        //   },
        // )

        drawer: Drawer(),
        body: Container(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                pinned: _pinned,
                snap: _snap,
                floating: _floating,
                expandedHeight: 230.0,
                backgroundColor: appBarColor,
                flexibleSpace: FlexibleSpaceBar(
                  title: const Text(
                    'Sm Mohib',
                    style: TextStyle(fontSize: 18, color: textColor),
                  ),
                  background: Image.network(
                    'https://images.pexels.com/photos/13728847/pexels-photo-13728847.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SliverToBoxAdapter(),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          height: 50.0,
                          child: const Padding(
                            padding: EdgeInsets.all(0.0),
                            child: ListTile(
                              title: Text(
                                "+8803784948",
                                style:
                                    TextStyle(fontSize: 18, color: textColor),
                              ),
                              subtitle: Text(
                                'Your Number',
                                style: TextStyle(color: textColor),
                              ),
                            ),
                          )),
                    );
                  },
                  childCount: 1,
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          height: 50.0,
                          child: const Padding(
                            padding: EdgeInsets.all(0.0),
                            child: ListTile(
                              title: Text(
                                "@smmohib",
                                style:
                                    TextStyle(fontSize: 18, color: textColor),
                              ),
                              subtitle: Text(
                                'Username',
                                style: TextStyle(color: textColor),
                              ),
                            ),
                          )),
                    );
                  },
                  childCount: 1,
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          height: 50.0,
                          child: const Padding(
                            padding: EdgeInsets.all(0.0),
                            child: ListTile(
                              title: Text(
                                "Bio",
                                style:
                                    TextStyle(fontSize: 18, color: textColor),
                              ),
                              subtitle: Text(
                                'Hi.. ',
                                style: TextStyle(color: textColor),
                              ),
                            ),
                          )),
                    );
                  },
                  childCount: 1,
                ),
              ),

              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Divider(
                          color: dividerColor,
                          thickness: 1,
                        ));
                  },
                  childCount: 1,
                ),
              ),

              //Notificaton
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          height: 40.0,
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: ListTile(
                              leading: const Icon(
                                Icons.notifications,
                                color: dividerColor,
                              ),
                              title: Text(
                                "Notification and Sound",
                                style: text20(),
                              ),
                            ),
                          )),
                    );
                  },
                  childCount: 1,
                ),
              ),
              //Privacy
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          height: 40.0,
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: ListTile(
                              leading: const Icon(
                                Icons.lock,
                                color: dividerColor,
                              ),
                              title: Text(
                                "Privacy  and Security",
                                style: text20(),
                              ),
                            ),
                          )),
                    );
                  },
                  childCount: 1,
                ),
              ),

              //chat setting
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          height: 40.0,
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: ListTile(
                              leading: const Icon(
                                Icons.chat,
                                color: dividerColor,
                              ),
                              title: Text(
                                "Chat Setting",
                                style: text20(),
                              ),
                            ),
                          )),
                    );
                  },
                  childCount: 1,
                ),
              ),

              //Language
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          height: 40.0,
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: ListTile(
                              leading: const Icon(
                                Icons.language,
                                color: dividerColor,
                              ),
                              title: Text(
                                "Language",
                                style: text20(),
                              ),
                            ),
                          )),
                    );
                  },
                  childCount: 1,
                ),
              ),
              //Ask a Question
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          height: 40.0,
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: ListTile(
                              leading: const Icon(
                                Icons.question_answer,
                                color: dividerColor,
                              ),
                              title: Text(
                                " Ask a Qeuestion",
                                style: text20(),
                              ),
                            ),
                          )),
                    );
                  },
                  childCount: 1,
                ),
              ), //Notificaton
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          height: 40.0,
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: ListTile(
                              leading: const Icon(
                                Icons.question_mark_sharp,
                                color: dividerColor,
                              ),
                              title: Text(
                                "EN Chat FAQ",
                                style: text20(),
                              ),
                            ),
                          )),
                    );
                  },
                  childCount: 1,
                ),
              ),
              //Privacy
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          height: 40.0,
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: ListTile(
                              leading: const Icon(
                                Icons.privacy_tip,
                                color: dividerColor,
                              ),
                              title: Text(
                                "Privacy Policy",
                                style: text20(),
                              ),
                            ),
                          )),
                    );
                  },
                  childCount: 1,
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          height: 40.0,
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: ListTile(
                              leading: const Icon(
                                Icons.block,
                                color: dividerColor,
                              ),
                              title: Text(
                                "Bloked",
                                style: text20(),
                              ),
                            ),
                          )),
                    );
                  },
                  childCount: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
