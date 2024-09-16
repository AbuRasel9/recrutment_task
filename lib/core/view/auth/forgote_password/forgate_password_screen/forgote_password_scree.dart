import 'package:flutter/material.dart';

import '../../login_screen/login_screen.dart';
import '../../widget/app_elevated_button.dart';
import '../../widget/backgoround_image.dart';
import '../../widget/have_account_or_not_widget.dart';
import '../../../../../common/widget/input_form_feild.dart';
import '../pin_verification_screen/pin_verification_screen.dart';

class ForgatePasswordScreen extends StatefulWidget {
  const ForgatePasswordScreen({super.key});

  @override
  State<ForgatePasswordScreen> createState() => _ForgatePasswordScreenState();
}

class _ForgatePasswordScreenState extends State<ForgatePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BackGroundImageLoginScreen(text: ""),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Your Email Address", style: textTheme.headlineLarge),
                  const SizedBox(height: 10),
                  Text(
                      "A 6 digit verification pin will send to your email address",
                      style: textTheme.titleSmall),
                  const SizedBox(height: 20),
                  const InputFormFeild(text: 'Email'),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PinVerificationScreen()));
                        },
                        child: Text("Continue")),
                  ),
                  const SizedBox(height: 20),
                  HaveAccountOrNotWidget(
                      text: "Have account?",
                      buttonText: "Sign in",
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                            (route) => false);
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
