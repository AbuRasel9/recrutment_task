import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:recruitment_tasks/common/extension/context_ext.dart';
import 'package:recruitment_tasks/core/view/auth/signUp_screen/signUp_screen.dart';
import 'package:recruitment_tasks/data/dataBase/data_base.dart';
import 'package:recruitment_tasks/data/data_model/login_model.dart';
import 'package:recruitment_tasks/utils/route/routes_name.dart';

import '../forgote_password/forgate_password_screen/forgote_password_scree.dart';
import '../widget/app_elevated_button.dart';
import '../widget/backgoround_image.dart';
import '../widget/have_account_or_not_widget.dart';
import '../../../../common/widget/input_form_feild.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final db = DataBaseHelper();
  bool isLoading = false;

  //login function
  login() async {
    setState(() {
      isLoading = true;

    });
    var response = await db.login(LoginModel(
        usrName: _emailController.text, password: _passwordController.text));
    print("------------------$response");
    setState(() {
          isLoading = false;

        });
    if (response == true) {
      Navigator.pushNamed(context, RoutesName.home);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please Enter Correct UserName or Password")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                //backaground image and title
                const BackGroundImageLoginScreen(
                  text: 'Get Started With',
                ),
                //login form feild
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      FadeInUp(
                          duration: const Duration(milliseconds: 1800),
                          child: Column(
                            children: [
                              InputFormFeild(
                                textEditingController: _emailController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter userName';
                                  }

                                  return null;
                                },
                                text: "Enter userName ",
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
                                text: "Enter Password",
                              )
                            ],
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1900),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                login();
                              }

                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>const MainBottomNavBar()));
                            },
                            child:isLoading?Center(child: CircularProgressIndicator(color: theme.colorScheme.onPrimary,),): Text("Login"),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FadeInUp(
                        duration: const Duration(milliseconds: 2000),
                        child: TextButton(
                          onPressed: () {},
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ForgatePasswordScreen()));
                            },
                            child: Text("Forgot Password?",
                                style: theme.textTheme.bodyMedium),
                          ),
                        ),
                      ),
                      FadeInUp(
                        duration: const Duration(milliseconds: 2000),
                        child: HaveAccountOrNotWidget(
                          text: "Don't Have Account?",
                          buttonText: "Sign Up",
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SignUpScreen()));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
