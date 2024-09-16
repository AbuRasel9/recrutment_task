import 'package:flutter/material.dart';

class InputFormFeild extends StatelessWidget {

  final FormFieldValidator? validator;
  final String text;
  final TextEditingController? textEditingController;

  const InputFormFeild({
    super.key,
    required this.text, this.validator, this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      validator: validator,
      decoration: InputDecoration(

          hintText: text,
      ),
    );
  }
}
