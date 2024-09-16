import 'package:flutter/material.dart';
import 'package:recruitment_tasks/common/extension/context_ext.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    required this.buttonText, required this.onPressed,
  });
  final VoidCallback onPressed;

  final String buttonText;

  @override
  Widget build(BuildContext context) {
    final theme=context.theme;
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: theme.textTheme.bodyLarge,
      ),
    );
  }
}
