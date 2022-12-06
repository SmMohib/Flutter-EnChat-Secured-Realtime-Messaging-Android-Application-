// ignore_for_file: prefer_const_constructors, unused_import

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myrsaapp/Screens/exitapp.dart';
import 'package:myrsaapp/Screens/feedbacks.dart';
import 'package:myrsaapp/common/utils/colors.dart';
import 'package:myrsaapp/common/widgets/error.dart';
import 'package:myrsaapp/common/widgets/loader.dart';
import 'package:myrsaapp/features/auth/controller/auth_controller.dart';
import 'package:myrsaapp/features/auth/screens/user_information_screen.dart';
import 'package:myrsaapp/features/chatroom/authScreen.dart';
import 'package:myrsaapp/features/chatroom/chatScreen.dart';
import 'package:myrsaapp/features/landing/screens/LoginPage.dart';
import 'package:myrsaapp/features/landing/screens/landing_screen.dart';
import 'package:myrsaapp/features/landing/screens/otpPage.dart';
import 'package:myrsaapp/features/landing/screens/setupProfilePage.dart';
import 'package:myrsaapp/firebase_options.dart';
import 'package:myrsaapp/mobile_layout_screen.dart';
import 'package:myrsaapp/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'UI',
      // ignore: duplicate_ignore
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: whiteColor,
        appBarTheme: const AppBarTheme(
          color: appBarColor,
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: blackColor),
          bodyText2: TextStyle(color: blackColor),
        ).apply(
          bodyColor: Color.fromARGB(255, 0, 0, 0),
          displayColor: Colors.blue,
        ),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: ref.watch(userDataAuthProvider).when(
            data: (user) {
              if (user == null) {
                return const LandingScreen();
              }
              return const MobileLayoutScreen();
            },
            error: (err, trace) {
              return ErrorScreen(
                error: err.toString(),
              );
            },
            loading: () => const Loader(),
          ),
     // home: LandingScreen(),
    );
  }

  // Future<bool> showExitPopup(context) async {
  //   return await showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           content: Container(
  //             height: 90,
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text("Do you want to exit?"),
  //                 SizedBox(height: 20),
  //                 Row(
  //                   children: [
  //                     Expanded(
  //                       child: ElevatedButton(
  //                         onPressed: () {
  //                           print('yes selected');
  //                           exit(0);
  //                         },
  //                         child: Text("Yes"),
  //                         style: ElevatedButton.styleFrom(
  //                             primary: Colors.red.shade800),
  //                       ),
  //                     ),
  //                     SizedBox(width: 15),
  //                     Expanded(
  //                         child: ElevatedButton(
  //                       onPressed: () {
  //                         print('no selected');
  //                         Navigator.of(context).pop();
  //                       },
  //                       child:
  //                           Text("No", style: TextStyle(color: Colors.black)),
  //                       style: ElevatedButton.styleFrom(
  //                         primary: Colors.white,
  //                       ),
  //                     ))
  //                   ],
  //                 )
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  // }
}

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
//   Widget home = AuthScreen();
//   FirebaseAuth auth = FirebaseAuth.instance;
//   if (auth.currentUser != null) {
//     home = ChatScreens();
//   }

//   runApp(
//     new MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Chat',
//       theme: ThemeData(
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: home,
//       // home: ChatScreen(),
//     ),
//   );
// }