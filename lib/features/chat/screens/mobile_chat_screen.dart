// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myrsaapp/common/utils/colors.dart';
import 'package:myrsaapp/common/utils/textFilld.dart';
import 'package:myrsaapp/common/utils/textStyle.dart';
import 'package:myrsaapp/common/widgets/custom_button.dart';
import 'package:myrsaapp/common/widgets/loader.dart';
import 'package:myrsaapp/features/auth/controller/auth_controller.dart';
import 'package:myrsaapp/features/call/controller/call_controller.dart';
import 'package:myrsaapp/features/call/screens/call_pickup_screen.dart';
import 'package:myrsaapp/features/chat/screens/rsa/rsamobilechat.dart';
import 'package:myrsaapp/features/chat/widgets/bottom_chat_field.dart';
import 'package:myrsaapp/features/chat/widgets/rsa/rsaChatList.dart';
import 'package:myrsaapp/models/user_model.dart';
import 'package:myrsaapp/features/chat/widgets/chat_list.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MobileChatScreen extends ConsumerWidget {
  static const String routeName = '/mobile-chat-screen';
  final String name;
  final String uid;
  //final bool isGroupChat;
  final String profilePic;
  MobileChatScreen({
    Key? key,
    required this.name,
    required this.uid,
    //  required this.isGroupChat,
    required this.profilePic,
  }) : super(key: key);
  //
  final _text = TextEditingController();

  bool _validate = false;

  @override
  void dispose() {
    _text.dispose();
    //super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

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
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: StreamBuilder<UserModel>(
            stream: ref.read(authControllerProvider).userDataById(uid),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Loader();
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name),
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
            onPressed: (() {}),
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
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            ////Encrepted
            // Container(
            //     height: 50,
            //     child: Center(
            //         child: DialogButton(
            //       highlightColor: Colors.white,
            //       splashColor: webAppBarColor,
            //       onPressed: () {
            //         Alert(
            //           context: context,
            //           type: AlertType.warning,
            //           //title: "Congratulation",
            //           desc: "Don't share private keys with anyone ",
            //           content: Column(
            //               // ignore: prefer_const_literals_to_create_immutables
            //               children: [
            //                 TextFormField(
            //                     controller: _text,
            //                     style: text20(),
            //                     validator: (_text) {
            //                       if (_text == null || _text.isEmpty) {
            //                         return 'Text is empty';
            //                       }
            //                       return null;
            //                     },
            //                     decoration:
            //                         InputDecoration(hintText: 'Private key')

            //                     // TextFiledDemo(name: name,profilePic:profilePic ,uid: uid),
            //                     // TextField(
            //                     //   controller: _text,
            //                     //   decoration: InputDecoration(
            //                     //     icon: Icon(Icons.lock),
            //                     //     labelStyle: text20(),
            //                     //     labelText: 'Enter the Value',
            //                     //     errorText:
            //                     //         _validate ? 'Value Can\'t Be Empty' : null,
            //                     //   ),
            //                     //   obscureText: true,
            //                     // ),

            //                     ),
            //               ]),
            //           buttons: [
            //             DialogButton(
            //                 child: Text(
            //                   "Cancel",
            //                   style:
            //                       TextStyle(color: Colors.white, fontSize: 20),
            //                 ),
            //                 onPressed: () {
            //                   Navigator.pop(context);
            //                 }),
            //             DialogButton(
            //                 child: Text(
            //                   "OK",
            //                   style:
            //                       TextStyle(color: Colors.white, fontSize: 20),
            //                 ),
            //                 onPressed: () {
            //                   if (_formKey.currentState!.validate()) {
            //                     Navigator.push(
            //                         context,
            //                         MaterialPageRoute(
            //                             builder: ((context) =>
            //                                 RsaMobileChatScreen(
            //                                   profilePic: profilePic,
            //                                   name: name,
            //                                   uid: uid,
            //                                 ))));

            //                     // TODO submit
            //                   }
            //                 }),
            //           ],
            //         ).show();
            //       },
            //       child: Text(
            //         "Encrepted",
            //         style: TextStyle(color: Colors.white, fontSize: 20),
            //       ),
            //       color: appBarColor,
            //     ))),
            // Expanded(
            //     child: Column(
            //   children: [],
            // )),
            Expanded(
                child: ChatList(
              recieverUserId: uid,
            )),
            // Expanded(
            //     child: ChatList(
            //   recieverUserId: uid,
            // )),
            BottomChatField(
              recieverUserId: uid,
              isGroupChat: name.isEmpty,
            )
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:myrsaapp/common/utils/colors.dart';
// import 'package:myrsaapp/common/widgets/loader.dart';
// import 'package:myrsaapp/features/auth/controller/auth_controller.dart';
// import 'package:myrsaapp/features/call/controller/call_controller.dart';
// import 'package:myrsaapp/features/call/screens/call_pickup_screen.dart';
// import 'package:myrsaapp/features/chat/widgets/bottom_chat_field.dart';
// import 'package:myrsaapp/features/chat/widgets/chat_list.dart';
// import 'package:myrsaapp/models/user_model.dart';

// class MobileChatScreen extends ConsumerWidget {
//   static const String routeName = '/mobile-chat-screen';
//   final String name;
//   final String uid;
//   final bool isGroupChat;
//   final String profilePic;
//   const MobileChatScreen({
//     Key? key,
//     required this.name,
//     required this.uid,
//     required this.isGroupChat,
//     required this.profilePic,
//   }) : super(key: key);

//   void makeCall(WidgetRef ref, BuildContext context) {
//     ref.read(callControllerProvider).makeCall(
//           context,
//           name,
//           uid,
//           profilePic,
//           isGroupChat,
//         );
//   }

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return CallPickupScreen(
//       scaffold: Scaffold(
//         appBar: AppBar(
//           backgroundColor: appBarColor,
//           title: StreamBuilder<UserModel>(
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
//           centerTitle: false,
//           actions: [
//             IconButton(
//               onPressed: () => makeCall(ref, context),
//               icon: const Icon(Icons.video_call),
//             ),
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(Icons.call),
//             ),
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(Icons.more_vert),
//             ),
//           ],
//         ),
//         body: Column(
//           children: [
//             Expanded(
//               child: ChatList(
//                 recieverUserId: uid,
//                 isGroupChat: isGroupChat,
//               ),
//             ),
//             BottomChatField(
//               recieverUserId: uid,
//               isGroupChat: isGroupChat,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
