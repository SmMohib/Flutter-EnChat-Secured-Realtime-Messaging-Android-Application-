import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myrsaapp/common/utils/colors.dart';
import 'package:myrsaapp/common/utils/textStyle.dart';
import 'package:myrsaapp/common/widgets/custom_button.dart';

class OTPPage extends StatelessWidget {
  const OTPPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verifying your phone number'),
        elevation: 0,
        backgroundColor: appBarColor,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              flex: 4,
              child: Image.asset(
                'assets/logo.png',
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Text(
                    'We have sent an SMS with a code.',
                    style: text20(),
                  ),
                  Text(
                    '+8801704448563',
                    style: text16(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 60,
                      child: ListView.builder(
                          itemCount: 6,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ((context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),

                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: CustomButton(text: 'Send', onPressed: () {}),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
