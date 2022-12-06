import 'package:flutter/material.dart';
import 'package:myrsaapp/common/utils/colors.dart';
import 'package:myrsaapp/common/widgets/custom_button.dart';
import 'package:myrsaapp/features/auth/screens/login_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  void navigateToLoginScreen(BuildContext context) {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Image.asset(
                'assets/logo.png',
              ),
            ),
            SizedBox(height: 40,),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'Read our Privacy Policy. Tap "Agree and continue" to accept the Terms of Service.',
                      style: TextStyle(color: textColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: size.width * 0.55,
                    child: CustomButton(
                      text: 'AGREE AND CONTINUE',
                      onPressed: () => navigateToLoginScreen(context),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
