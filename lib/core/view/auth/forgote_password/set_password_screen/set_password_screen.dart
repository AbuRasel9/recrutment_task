
import 'package:flutter/material.dart';

import '../../widget/backgoround_image.dart';
import '../../../../../common/widget/input_form_feild.dart';
import '../pin_verification_screen/widget/pin_feilds.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  final _passwordController=TextEditingController();
  final _confirmPasswordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Column(
        children: [
          const BackGroundImageLoginScreen(text: ""),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Set Password",
                  style: textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Minimum length password 8 character with Latter and number combination ",
                  style: textTheme.titleSmall,
                ),
                const SizedBox(
                  height: 20,
                ),
                 InputFormFeild(
                    textEditingController: _passwordController,

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Password';
                      }

                      return null;
                    },
                    text: "Password"),
                const SizedBox(
                  height: 20,
                ),
                 InputFormFeild(
                    textEditingController: _confirmPasswordController,

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Confirm Password';
                      }

                      return null;
                    },
                    text: "Confirm Password"),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  child: const Text("Confirm"),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const PinFeild()));
                  },

                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
