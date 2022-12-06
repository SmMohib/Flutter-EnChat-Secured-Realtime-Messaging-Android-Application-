import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myrsaapp/common/utils/colors.dart';
import 'package:myrsaapp/common/utils/snakbar.dart';
import 'package:myrsaapp/common/utils/textStyle.dart';
import 'package:myrsaapp/common/widgets/custom_button.dart';
import 'package:myrsaapp/features/auth/controller/auth_controller.dart';

class LoginPage extends ConsumerStatefulWidget {
  static const routeName = '/login-screen';
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final phoneController = TextEditingController();
  Country? country;

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  void pickCountry() {
    showCountryPicker(
        context: context,
        onSelect: (Country _country) {
          setState(() {
            country = _country;
          });
        });
  }

  void sendPhoneNumber() {
    String phoneNumber = phoneController.text.trim();
    if (country != null && phoneNumber.isNotEmpty) {
      ref
          .read(authControllerProvider)
          .signInWithPhone(context, '+${country!.phoneCode}$phoneNumber');
    } else {
      showSnackBar(context: context, content: 'Fill out all the fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      // appBar: AppBar(
      //   // title: const Text('Enter your phone number'),
      //   elevation: 0,
      //   backgroundColor: appBarColor,
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: Image.asset(
              'assets/logo.png',
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Expanded(flex: 2, child: Text('')),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    'Enter Your Phone Number',
                    style: TextStyle(color: textColor),
                    textAlign: TextAlign.center,
                  ),
                ),
                // const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    child: Row(
                      children: [
                        Text(
                          '+88',
                          style: text16(),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '01704448563',
                          style: text16(),
                        )
                      ],
                    ),
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        border:
                            Border.all(color: Color.fromARGB(255, 21, 22, 24))),
                    height: 40,
                    width: double.infinity,
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: SizedBox(
                    width: size.width * 0.55,
                    child: Center(
                      child: CustomButton(
                        text: 'Send',
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
