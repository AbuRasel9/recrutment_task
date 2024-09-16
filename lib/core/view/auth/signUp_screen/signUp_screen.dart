import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:recruitment_tasks/common/extension/context_ext.dart';
import 'package:recruitment_tasks/data/dataBase/data_base.dart';
import 'package:recruitment_tasks/data/data_model/registration_model.dart';
import 'package:recruitment_tasks/utils/route/routes_name.dart';
import '../login_screen/login_screen.dart';
import '../widget/app_elevated_button.dart';
import '../widget/backgoround_image.dart';
import '../widget/have_account_or_not_widget.dart';
import '../../../../common/widget/input_form_feild.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _mobileController = TextEditingController();
  bool _isLoading = false;
  final db = DataBaseHelper();

  _signUp() async {
    setState(() {
      _isLoading = true;
    });

      await db.signUp(
        RegistrationModel(
          password: _passwordController.text,
          usrName: _emailController.text,
          firstName: _firstNameController.text,
          lastName: _lastNameController.text,
          mobile: _mobileController.text,
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registration Successfully")),
      );

      // After success user creation go to login screen
      Navigator.pushNamed(
        context,
        RoutesName.login,);
      setState(() {
        _isLoading = false;

      });


  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BackGroundImageLoginScreen(
              text: "Join With Us",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    InputFormFeild(
                      textEditingController: _emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Email';
                        }
                        return null;
                      },
                      text: "Enter Email",
                    ),
                    const SizedBox(height: 13),
                    InputFormFeild(
                      textEditingController: _firstNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter First Name';
                        }
                        return null;
                      },
                      text: "Enter First Name",
                    ),
                    const SizedBox(height: 13),
                    InputFormFeild(
                      textEditingController: _lastNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Last Name';
                        }
                        return null;
                      },
                      text: "Enter Last Name",
                    ),
                    const SizedBox(height: 13),
                    InputFormFeild(
                      textEditingController: _mobileController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Mobile';
                        }
                        return null;
                      },
                      text: "Enter Mobile",
                    ),
                    const SizedBox(height: 13),
                    InputFormFeild(
                      textEditingController: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Password';
                        }
                        return null;
                      },
                      text: "Enter Password",
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _signUp();
                          }
                        },
                        child: _isLoading
                            ? Center(
                          child: CircularProgressIndicator(
                            color: theme.colorScheme.onPrimary,
                          ),
                        )
                            : Text("Continue"),
                      ),
                    ),

                    HaveAccountOrNotWidget(
                      text: "Have Account",
                      buttonText: "Sign In",
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                              (route) => false,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
