import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:recruitment_tasks/common/extension/context_ext.dart';

class PinFeild extends StatelessWidget {
  const PinFeild({super.key});

  @override
  Widget build(BuildContext context) {
    final theme=context.theme;
    return PinCodeTextField(

      length: 4,
      obscureText: false,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        activeFillColor: theme.colorScheme.onPrimary,
        inactiveFillColor:  theme.colorScheme.onPrimary,
        selectedFillColor:  theme.colorScheme.onPrimary,

        activeColor: Colors.white,
        inactiveColor: Colors.white,
        selectedColor: Colors.white,


        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 45,

      ),
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      onCompleted: (v) {
      },


       appContext: context,
    );
  }
}
