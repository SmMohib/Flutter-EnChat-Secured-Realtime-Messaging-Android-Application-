// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myrsaapp/common/enums/message_enum.dart';
import 'package:myrsaapp/common/providers/message_reply_provider.dart';
import 'package:myrsaapp/common/utils/colors.dart';

import 'package:swipe_to/swipe_to.dart';

class RsaChatList extends ConsumerStatefulWidget {
  final String? recieverUserId;
  final String? message;
  final String? date;
  final MessageEnum? type;
  final VoidCallback? onLeftSwipe;
  final String? repliedText;
  final String? username;
  final MessageEnum? repliedMessageType;
  final bool? isSeen;
  //final bool isGroupChat;
  const RsaChatList({
    Key? key,
    this.recieverUserId,
    this.message,
    this.date,
    this.type,
    this.onLeftSwipe,
    this.repliedText,
    this.username,
    this.repliedMessageType,
    this.isSeen,
    // required this.isGroupChat,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RsaChatListState();
}

class _RsaChatListState extends ConsumerState<RsaChatList> {
  final ScrollController messageController = ScrollController();

  @override
  void dispose() {
    super.dispose();
    messageController.dispose();
  }

  void onMessageSwipe(
    String message,
    bool isMe,
    MessageEnum messageEnum,
  ) {
    ref.read(messageReplyProvider.state).update(
          (state) => MessageReply(
            message,
            isMe,
            messageEnum,
          ),
        );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(
      children: [
        Container(
          height: 50,
          width: double.maxFinite,
          child: SwipeTo(
            child: Align(
              alignment: Alignment.centerRight,
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width - 55,
                  ),
                  child: Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: messageColor,
                      child: Stack(children: [
                        Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'uysyetreyryrnafdsme',
                                style: const TextStyle(color: whiteColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]))),
            ),
          ),
        ),
        Container(
          height: 50,
          width: double.maxFinite,
          child: SwipeTo(
            child: Align(
              alignment: Alignment.centerRight,
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width - 55,
                  ),
                  child: Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: messageColor,
                      child: Stack(children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'errwty7trrt',
                                style: const TextStyle(color: whiteColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]))),
            ),
          ),
        ),
        Container(
          height: 50,
          width: double.maxFinite,
          child: SwipeTo(
            child: Align(
              alignment: Alignment.centerRight,
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width - 55,
                  ),
                  child: Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: messageColor,
                      child: Stack(children: [
                        Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'ccecrrwczxty7trrt',
                                style: const TextStyle(color: whiteColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]))),
            ),
          ),
        ), Container(
          height: 50,
          width: double.maxFinite,
          child: SwipeTo(
            child: Align(
              alignment: Alignment.centerRight,
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width - 55,
                  ),
                  child: Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: messageColor,
                      child: Stack(children: [
                        Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'ccecrrwczxty7trrt',
                                style: const TextStyle(
                                  color: whiteColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]))),
            ),
          ),
        ), Container(
          height: 50,
          width: double.maxFinite,
          child: SwipeTo(
            child: Align(
              alignment: Alignment.centerRight,
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width - 55,
                  ),
                  child: Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: messageColor,
                      child: Stack(children: [
                        Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'crrwczxty7trrt',
                                style: const TextStyle(color: whiteColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]))),
            ),
          ),
        ),
      ],
    );
    //??/////////////////////////
    // return StreamBuilder<List<Message>>(
    //     stream: ref
    //             .read(chatControllerProvider)
    //             .chatStream(widget.recieverUserId),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return const Loader();
    //       }

    //       SchedulerBinding.instance.addPostFrameCallback((_) {
    //         messageController
    //             .jumpTo(messageController.position.maxScrollExtent);
    //       });
    //    return ListView.builder(
    //         controller: messageController,
    //         itemCount: snapshot.data!.length,
    //         itemBuilder: (context, index) {
    //           final messageData = snapshot.data![index];
    //           var timeSent = DateFormat.Hm().format(messageData.timeSent);

    //           if (!messageData.isSeen &&
    //               messageData.recieverid ==
    //                   FirebaseAuth.instance.currentUser!.uid) {
    //             ref.read(chatControllerProvider).setChatMessageSeen(
    //                   context,
    //                   widget.recieverUserId,
    //                   messageData.messageId,
    //                 );
    //           }
    //           if (messageData.senderId ==
    //               FirebaseAuth.instance.currentUser!.uid) {
    //             return MyMessageCard(
    //               message: messageData.text,
    //               date: timeSent,
    //               type: messageData.type,
    //               repliedText: messageData.repliedMessage,
    //               username: messageData.repliedTo,
    //               repliedMessageType: messageData.repliedMessageType,
    //               onLeftSwipe: () => onMessageSwipe(
    //                 messageData.text,
    //                 true,
    //                 messageData.type,
    //               ),
    //               isSeen: messageData.isSeen,
    //             );
    //           }
    //           return SenderMessageCard(
    //             message: messageData.text,
    //             date: timeSent,
    //             type: messageData.type,
    //             username: messageData.repliedTo,
    //             repliedMessageType: messageData.repliedMessageType,
    //             onRightSwipe: () => onMessageSwipe(
    //               messageData.text,
    //               false,
    //               messageData.type,
    //             ),
    //             repliedText: messageData.repliedMessage,
    //           );
    //         },
    //       );
    //     });
  }
}
