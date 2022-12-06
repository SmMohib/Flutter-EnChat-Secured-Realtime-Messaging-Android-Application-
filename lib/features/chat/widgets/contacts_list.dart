import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:myrsaapp/common/utils/colors.dart';
import 'package:myrsaapp/common/utils/textStyle.dart';
import 'package:myrsaapp/common/widgets/loader.dart';
import 'package:myrsaapp/features/auth/screens/login_screen.dart';
import 'package:myrsaapp/features/chat/controller/chat_controller.dart';
import 'package:myrsaapp/features/chat/screens/mobile_chat_screen.dart';
import 'package:myrsaapp/features/chatroom/authScreen.dart';
import 'package:myrsaapp/features/chatroom/chatScreen.dart';
import 'package:myrsaapp/features/chatroom/joinRoom.dart';
import 'package:myrsaapp/features/encriptionchat/createprivatekey.dart';
import 'package:myrsaapp/models/chat_contact.dart';
import 'package:myrsaapp/models/group.dart';

class ContactsList extends ConsumerWidget {
  ContactsList({Key? key}) : super(key: key);
  String? _selectedMenu = '';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat'), actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
          ),
        ),
        // IconButton(
        //   icon: Icon(Icons.lock),
        //   onPressed: () {
        //     Navigator.push(context,
        //         MaterialPageRoute(builder: ((context) => AuthScreen())));
        //   },
        // ),
        IconButton(
          icon: Icon(Icons.lock),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => CreatePrivateKey())));
          },
        ),
      ]),
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
                                    padding: const EdgeInsets.only(top: 6.0),
                                    child: Text(
                                      groupData.lastMessage,
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                       // 'http://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg'
                                         groupData.groupPic,
                                        ),
                                    radius: 30,
                                  ),
                                  trailing: Text(
                                    DateFormat.Hm().format(groupData.timeSent),
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
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
                                      chatContactData.lastMessage,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Color.fromARGB(207, 0, 0, 0),
                                      ),
                                    ),
                                  ),
                                  leading: CircleAvatar(
                                    backgroundColor: greyColor,
                                    backgroundImage: NetworkImage(
                                         chatContactData.profilePic,
                                        ),
                                    radius: 30,
                                  ),
                                  trailing: Text(
                                    DateFormat.Hm()
                                        .format(chatContactData.timeSent),
                                    style: const TextStyle(
                                      color: Color.fromARGB(207, 0, 0, 0),
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
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
