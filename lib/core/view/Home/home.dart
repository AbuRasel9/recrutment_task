import 'package:flutter/material.dart';
import 'package:recruitment_tasks/common/extension/context_ext.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
            },
            icon: Icon(
              Icons.person,
              color: theme.colorScheme.onPrimary,
            ),
          )
        ],
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: theme.colorScheme.onPrimary,
            )),
        backgroundColor: theme.colorScheme.primary,
        title: Text(
          "DashBoard",
          style: theme.textTheme.bodyLarge
              ?.copyWith(color: theme.colorScheme.onPrimary),
        ),
      ),
    );
  }
}
