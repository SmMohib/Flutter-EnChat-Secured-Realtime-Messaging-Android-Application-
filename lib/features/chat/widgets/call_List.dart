import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:myrsaapp/common/utils/colors.dart';
import 'package:myrsaapp/common/utils/textStyle.dart';
import 'package:myrsaapp/common/widgets/loader.dart';
import 'package:myrsaapp/features/chat/controller/chat_controller.dart';
import 'package:myrsaapp/features/chat/screens/mobile_chat_screen.dart';
import 'package:myrsaapp/features/chatroom/authScreen.dart';
import 'package:myrsaapp/features/chatroom/chatScreen.dart';
import 'package:myrsaapp/features/chatroom/joinRoom.dart';
import 'package:myrsaapp/models/chat_contact.dart';
import 'package:myrsaapp/models/group.dart';

class CallList extends ConsumerWidget {
  CallList({Key? key}) : super(key: key);
  String? _selectedMenu = '';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Call'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ),
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext contesxt) {
              return [
                // PopupMenuItem(
                //   // ignore: sort_child_properties_last
                //   child: InkWell(
                //       onTap: () {},
                //       child: Text(
                //         "RSA Chat",
                //         style: text20(),
                //       )),
                //   value: "Add New",
                // ),
                PopupMenuItem(
                  // ignore: sort_child_properties_last
                  child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          //  return AuthScreen();
                          return JoinRoom();
                          // FirebaseAuth auth = FirebaseAuth.instance;
                          // if (auth.currentUser != null) {
                          //   ChatScreens();
                          // }
                        }));
                      },
                      child: Text("Secure Chat", style: text20())),
                  value: "Secure Chat",
                ),
              ];
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder<List<Group>>(
                  stream: ref.watch(chatControllerProvider).chatGroups(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Loader();
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var groupData = snapshot.data![index];

                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  MobileChatScreen.routeName,
                                  arguments: {
                                    'name': groupData.name,
                                    'uid': groupData.groupId,
                                    'isGroupChat': true,
                                    'profilePic': groupData.groupPic,
                                  },
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: ListTile(
                                    title: Text(
                                      groupData.name,
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    subtitle: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 6.0),
                                        child: Text(
                                          DateFormat.Hm()
                                              .format(groupData.timeSent),
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 13,
                                          ),
                                        )),
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        groupData.groupPic,
                                      ),
                                      radius: 30,
                                    ),
                                    trailing: IconButton(
                                      icon: Icon(Icons.call),
                                      onPressed: () {},
                                    )),
                              ),
                            ),
                            const Divider(
                              color: dividerColor,
                            ),
                          ],
                        );
                      },
                    );
                  }),
              StreamBuilder<List<ChatContact>>(
                  stream: ref.watch(chatControllerProvider).chatContacts(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Loader();
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var chatContactData = snapshot.data![index];

                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  MobileChatScreen.routeName,
                                  arguments: {
                                    'name': chatContactData.name,
                                    'uid': chatContactData.contactId,
                                    'isGroupChat': false,
                                    'profilePic': chatContactData.profilePic,
                                  },
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: ListTile(
                                    title: Text(
                                      chatContactData.name,
                                      style: const TextStyle(
                                        color: Color.fromARGB(207, 0, 0, 0),
                                        fontSize: 19,
                                      ),
                                    ),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.only(top: 6.0),
                                      child: Text(
                                        DateFormat.Hm()
                                            .format(chatContactData.timeSent),
                                        style: const TextStyle(
                                          color: Color.fromARGB(207, 0, 0, 0),
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        chatContactData.profilePic,
                                      ),
                                      radius: 30,
                                    ),
                                    trailing: IconButton(
                                      icon: Icon(Icons.call),
                                      onPressed: () {},
                                    )),
                              ),
                            ),
                            // const Divider(
                            //   color: dividerColor,
                            // ),
                          ],
                        );
                      },
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
