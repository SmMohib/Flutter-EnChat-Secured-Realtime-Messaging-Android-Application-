// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myrsaapp/common/widgets/custom_button.dart';

class SetupProfile extends StatelessWidget {
  const SetupProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setup Profile'),
      ),
      body: SafeArea(
        child: Center(
            child: Column(children: [
          SizedBox(
            height: 20,
          ),
          Stack(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg'),
                radius: 100,
              ),
              Positioned(
                  bottom: 10,
                  right: 10,
                  child: IconButton(
                      onPressed: () {}, icon: Icon(Icons.camera_alt))),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: TextFormField(
              decoration: InputDecoration(hintText: 'Name'),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: CustomButton(text: 'Next', onPressed: () {}),
          )
        ])),
      ),
    );
  }
}
