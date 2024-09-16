
import 'package:flutter/material.dart';

import '../../login_screen/login_screen.dart';
import '../../widget/app_elevated_button.dart';
import '../../widget/backgoround_image.dart';
import '../../widget/have_account_or_not_widget.dart';
import '../set_password_screen/set_password_screen.dart';
import 'widget/pin_feilds.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BackGroundImageLoginScreen(text: ""),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "PIN Verification",
                    style: textTheme.headlineLarge,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "A 6 digit verification pin will send to your email address",
                    style: textTheme.titleSmall,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const PinFeild(),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SetPasswordScreen()));
                    }, child:Text( "Verify")),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  HaveAccountOrNotWidget(
                    text: "Have Account?",
                    buttonText: "Sign in",
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                          (route) => false);
                    },
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
