// ignore_for_file: prefer_const_constructors, deprecated_member_use, unused_field

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myrsaapp/common/utils/colors.dart';
import 'package:myrsaapp/common/utils/textStyle.dart';
import 'package:myrsaapp/features/auth/controller/auth_controller.dart';

class UserInformationScreen extends ConsumerStatefulWidget {
  static const String routeName = '/user-information';
  const UserInformationScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<UserInformationScreen> createState() =>
      _UserInformationScreenState();
}

class _UserInformationScreenState extends ConsumerState<UserInformationScreen> {
  final TextEditingController nameController = TextEditingController();
  File? image;
  final _formKey = GlobalKey<FormState>();
  late String _userEmail;
  late String _userName;
  late String _userPass;
  var _isLogin = true;
  final picker = ImagePicker();
  late File _image;

  Color button = Color(0xffeeeeee);

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  // void selectImage() async {
  //   // image = await pickImageFromGallery(context);
  //   setState(() {});
  // }

  void storeUserData() async {
    String name = nameController.text.trim();

    if (name.isNotEmpty) {
      ref.read(authControllerProvider).saveUserDataToFirebase(
            context,
            name,
            image,
          );
    }
  }

  void _pickImage() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.gallery, imageQuality: 50, maxWidth: 150);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Profile'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 20,
            ),
            Stack(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(
                        'https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/boy_male_avatar_portrait-512.png')),
              ],
            ),
            TextButton.icon(
                icon: Icon(Icons.image),
                label: Text('Add Image'),
                onPressed: () {
                  _pickImage();
                }),
            // Stack(
            //   children: [
            //     image == null
            //         ? const CircleAvatar(
            //             backgroundImage: NetworkImage(
            //               'https://png.pngitem.com/pimgs/s/649-6490124_katie-notopoulos-katienotopoulos-i-write-about-tech-round.png',
            //             ),
            //             radius: 64,
            //           )
            //         : CircleAvatar(
            //             backgroundImage: FileImage(
            //               image!,
            //             ),
            //             radius: 64,
            //           ),
            //     Positioned(
            //       bottom: -10,
            //       left: 80,
            //       child: IconButton(
            //         onPressed: _pickImage,
            //         icon: const Icon(
            //           Icons.add_a_photo,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            Row(
              children: [
                Container(
                  width: size.width * 0.78,
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    style: text16(),
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your name',
                    ),
                  ),
                ),
                FloatingActionButton(
                  backgroundColor: buttonColor,
                  onPressed: storeUserData,
                  child: const Icon(
                    Icons.done,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
