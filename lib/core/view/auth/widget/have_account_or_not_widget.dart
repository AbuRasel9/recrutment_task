import 'package:flutter/material.dart';
import 'package:recruitment_tasks/common/extension/context_ext.dart';

class HaveAccountOrNotWidget extends StatelessWidget {
  const HaveAccountOrNotWidget({
    super.key,
    required this.text,
    required this.buttonText, required this.onPressed,
  });
  final VoidCallback onPressed;

  final String text;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    final theme=context.theme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style:theme.textTheme.bodyMedium
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500,color: theme.colorScheme.primary),

          ),
        ),
      ],
    );
  }
}
