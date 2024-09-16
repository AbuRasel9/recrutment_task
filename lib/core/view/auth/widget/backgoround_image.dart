import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:recruitment_tasks/common/extension/context_ext.dart';

class BackGroundImageLoginScreen extends StatelessWidget {
  const BackGroundImageLoginScreen({
    super.key, required this.text,
  });
  final String? text;

  @override
  Widget build(BuildContext context) {
    final theme=context.theme;
    return Container(
      height: 400,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.fill),),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 30,
            width: 80,
            height: 200,
            child: FadeInUp(
              duration: const Duration(seconds: 1),
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/light-1.png'),),),
              ),
            ),
          ),
          Positioned(
            left: 140,
            width: 80,
            height: 150,
            child: FadeInUp(
              duration: const Duration(milliseconds: 1200),
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/light-2.png'))),
              ),
            ),
          ),
          Positioned(
            right: 40,
            top: 40,
            width: 80,
            height: 150,
            child: FadeInUp(
              duration: const Duration(milliseconds: 1300),
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/clock.png'))),
              ),
            ),
          ),
          Positioned(
            child: FadeInUp(
              duration: const Duration(milliseconds: 1600),
              child: Container(
                margin: const EdgeInsets.only(top: 50),
                child:  Center(
                  child: Text(
                    text!,
                    style: theme.textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold,color: theme.colorScheme.onPrimary),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
