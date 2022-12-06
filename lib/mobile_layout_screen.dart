// ignore_for_file: prefer_final_fields, prefer_const_constructors
//import 'package:flutter_tutorial/widgets/exit-popup.dart';

import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myrsaapp/Screens/UserProfile/ProfilePage.dart';
import 'package:myrsaapp/common/utils/colors.dart';
import 'package:myrsaapp/common/utils/textStyle.dart';

import 'package:myrsaapp/features/auth/controller/auth_controller.dart';
import 'package:myrsaapp/features/chat/widgets/call_List.dart';
import 'package:myrsaapp/features/group/screens/create_group_screen.dart';
import 'package:myrsaapp/features/group/widgets/select_contacts_group.dart';
import 'package:myrsaapp/features/select_contacts/screens/select_contacts_screen.dart';
import 'package:myrsaapp/features/chat/widgets/contacts_list.dart';
import 'package:myrsaapp/features/status/screens/status_contacts_screen.dart';

class MobileLayoutScreen extends ConsumerStatefulWidget {
  const MobileLayoutScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<MobileLayoutScreen> createState() => _MobileLayoutScreenState();
}

class _MobileLayoutScreenState extends ConsumerState<MobileLayoutScreen> {
  int _pageIndex = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  List pages = [
    MyRoute(
      iconData: Icons.chat,
      page: ContactsList(),
    ),
    MyRoute(
      iconData: Icons.call,
      page: CallList(),
    ),
    MyRoute(
      iconData: Icons.add,
      page: SelectContactsScreen(),
    ),
    MyRoute(
      iconData: Icons.people,
      page: CreateGroupScreen(),
    ),
    MyRoute(
      iconData: Icons.person,
      page: ProfilePage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup(context) async {
      return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Container(
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Do you want to exit?",
                      style: text16(),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              print('yes selected');
                              exit(0);
                            },
                            child: Text("Yes"),
                            style:
                                ElevatedButton.styleFrom(primary: buttonColor),
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                            child: ElevatedButton(
                          onPressed: () {
                            print('no selected');
                            Navigator.of(context).pop();
                          },
                          child:
                              Text("No", style: TextStyle(color: Colors.black)),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                          ),
                        ))
                      ],
                    )
                  ],
                ),
              ),
            );
          });
    }

    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
        // endDrawer: new MyEndDrawer(),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 60.0,
          items: pages
              .map(
                (p) => Icon(
                  p.iconData,
                  size: 30,
                  color: Colors.white,
                ),
              )
              .toList(),
          // color: Color(0xff4367b1),
          color: appBarColor,
          buttonBackgroundColor: appBarColor,
          //buttonBackgroundColor: Color(0xff4367b1),
          backgroundColor: whiteColor,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 500),
          onTap: (index) {
            setState(
              () {
                _pageIndex = index;
              },
            );
          },
        ),
        backgroundColor: Colors.white,
        body: pages[_pageIndex].page,
      ),
    );
  }
}

class MyRoute {
  final IconData iconData;
  final Widget page;

  MyRoute({required this.iconData, required this.page});
}

// class MobileLayoutScreen extends ConsumerStatefulWidget {
//   const MobileLayoutScreen({Key? key}) : super(key: key);

//   @override
//   ConsumerState<MobileLayoutScreen> createState() => _MobileLayoutScreenState();
// }

// class _MobileLayoutScreenState extends ConsumerState<MobileLayoutScreen>
//     with WidgetsBindingObserver, TickerProviderStateMixin {
//   late TabController tabBarController;
//   @override
//   void initState() {
//     super.initState();
//     tabBarController = TabController(length: 3, vsync: this);
//     WidgetsBinding.instance.addObserver(this);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     WidgetsBinding.instance.removeObserver(this);
//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     super.didChangeAppLifecycleState(state);
//     switch (state) {
//       case AppLifecycleState.resumed:
//         ref.read(authControllerProvider).setUserState(true);
//         break;
//       case AppLifecycleState.inactive:
//       case AppLifecycleState.detached:
//       case AppLifecycleState.paused:
//         ref.read(authControllerProvider).setUserState(false);
//         break;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           elevation: 0,
//           backgroundColor: appBarColor,
//           centerTitle: false,
//           title: const Text(
//             'WhatsApp',
//             style: TextStyle(
//               fontSize: 20,
//               color: Colors.grey,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           actions: [
//             IconButton(
//               icon: const Icon(Icons.search, color: Colors.grey),
//               onPressed: () {},
//             ),
//             PopupMenuButton(
//               icon: const Icon(
//                 Icons.more_vert,
//                 color: Colors.grey,
//               ),
//               itemBuilder: (context) => [
//                 // PopupMenuItem(
//                 //     child: const Text(
//                 //       'Create Group',
//                 //     ),
//                 //     onTap: ()  =>Future(
//                 //      () => Navigator.pushNamed(
//                 //         context, CreateGroupScreen.routeName),
//                 //     ),
//                 //     )
//               ],
//             ),
//           ],
//           bottom: TabBar(
//             controller: tabBarController,
//             indicatorColor: tabColor,
//             indicatorWeight: 4,
//             labelColor: tabColor,
//             unselectedLabelColor: Colors.grey,
//             labelStyle: const TextStyle(
//               fontWeight: FontWeight.bold,
//             ),
//             tabs: const [
//               Tab(
//                 text: 'CHATS',
//               ),
//               Tab(
//                 text: 'STATUS',
//               ),
//               Tab(
//                 text: 'CALLS',
//               ),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           controller: tabBarController,
//           children: const [
//             ContactsList(),
//             // StatusContactsScreen(),
//             Text('Calls'), Text('Calls'), //Text('Calls'),
//           ],
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () async {
//             if (tabBarController.index == 0) {
//               Navigator.pushNamed(context, SelectContactsScreen.routeName);
//             } else {
//               //File? pickedImage = await pickImageFromGallery(context);
//               //  if (pickedImage != null) {
//               //   Navigator.pushNamed(
//               //    context,
//               //    ConfirmStatusScreen.routeName,
//               //    arguments: pickedImage,
//               //  );
//               //  }
//             }
//           },
//           backgroundColor: tabColor,
//           child: const Icon(
//             Icons.comment,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }
