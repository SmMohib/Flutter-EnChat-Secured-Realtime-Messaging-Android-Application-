import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myrsaapp/common/utils/colors.dart';
import 'package:myrsaapp/common/widgets/loader.dart';
import 'package:myrsaapp/features/auth/controller/auth_controller.dart';
import 'package:myrsaapp/features/call/controller/call_controller.dart';
import 'package:myrsaapp/features/call/screens/call_pickup_screen.dart';
import 'package:myrsaapp/features/chat/widgets/bottom_chat_field.dart';
import 'package:myrsaapp/models/user_model.dart';
import 'package:myrsaapp/features/chat/widgets/chat_list.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class RsaMobileChatScreen extends ConsumerWidget {
  static const String routeName = '/mobile-chat-screen';
  final String ?name;
  final String? uid;
  //final bool isGroupChat;
  final String? profilePic;
  const RsaMobileChatScreen({
    Key? key,
    this.name,
     this.uid,
    //  required this.isGroupChat,
    required this.profilePic,
  }) : super(key: key);

  // void makeCall(WidgetRef ref, BuildContext context) {
  //   ref.read(callControllerProvider).makeCall(
  //         context,
  //         name,
  //         uid,
  //         profilePic,
  //         isGroupChat,
  //       );
  // }

  @override
  // Widget build(BuildContext context, WidgetRef ref) {
  Widget build(BuildContext context, WidgetRef ref) {
    // return CallPickupScreen(
    //   scaffold: Scaffold(
    //     appBar: AppBar(
    //       backgroundColor: appBarColor,
    //       title: isGroupChat
    //           ? Text(name)
    //           : StreamBuilder<UserModel>(
    //               stream: ref.read(authControllerProvider).userDataById(uid),
    //               builder: (context, snapshot) {
    //                 if (snapshot.connectionState == ConnectionState.waiting) {
    //                   return const Loader();
    //                 }
    //                 return Column(
    //                   children: [
    //                     Text(name),
    //                     Text(
    //                       snapshot.data!.isOnline ? 'online' : 'offline',
    //                       style: const TextStyle(
    //                         fontSize: 13,
    //                         fontWeight: FontWeight.normal,
    //                       ),
    //                     ),
    //                   ],
    //                 );
    //               }),
    //       centerTitle: false,
    //       actions: [
    //         IconButton(
    //           onPressed: () => makeCall(ref, context),
    //           icon: const Icon(Icons.video_call),
    //         ),
    //         IconButton(
    //           onPressed: () {},
    //           icon: const Icon(Icons.call),
    //         ),
    //         IconButton(
    //           onPressed: () {},
    //           icon: const Icon(Icons.more_vert),
    //         ),
    //       ],
    //     ),
    //     body: Column(
    //       children: [
    //         Expanded(
    //           child: ChatList(
    //             recieverUserId: uid,
    //             isGroupChat: isGroupChat,
    //           ),
    //         ),
    //         BottomChatField(
    //           recieverUserId: uid,
    //           isGroupChat: isGroupChat,
    //         ),
    //       ],
    //     ),
    //   ),
    // );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: StreamBuilder<UserModel>(
            stream: ref.read(authControllerProvider).userDataById(uid!),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Loader();
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name!),
                  Text(
                    snapshot.data!.isOnline ? 'Online' : 'Offline',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              );
            }),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.video_call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        children: [
          ////Encrepted
          //       Container(
          //           height: 50,
          //           child: Center(
          //               child: DialogButton(
          //             onPressed: () {
          //              Alert(
          //   context: context,
          //   type: AlertType.warning,
          //   title: "RFLUTTER ALERT",
          //   desc: "Flutter is more awesome with RFlutter Alert.",
          //   buttons: [
          //     DialogButton(
          //       child: Text(
          //         "FLAT",
          //         style: TextStyle(color: Colors.white, fontSize: 20),
          //       ),
          //       onPressed: () => Navigator.pop(context),
          //       color: Color.fromRGBO(0, 179, 134, 1.0),
          //     ),
          //     DialogButton(
          //       child: Text(
          //         "GRADIENT",
          //         style: TextStyle(color: Colors.white, fontSize: 20),
          //       ),
          //       onPressed: () => Navigator.pop(context),
          //       gradient: LinearGradient(colors: [
          //         Color.fromRGBO(116, 116, 191, 1.0),
          //         Color.fromRGBO(52, 138, 199, 1.0)
          //       ]),
          //     )
          //   ],
          // ).show();
          //             },
          //             child: Text(
          //               "Decrepted",
          //               style: TextStyle(color: Colors.white, fontSize: 20),
          //             ),
          //             color: appBarColor,
          //           ))),

          Expanded(
            child: ChatList(
              recieverUserId: uid!, // isGroupChat: isGroupChat,
            ),
          ),
          BottomChatField(
            recieverUserId: uid!,
            isGroupChat: name!.isEmpty,
          )
        ],
      ),
    );
  }
}
