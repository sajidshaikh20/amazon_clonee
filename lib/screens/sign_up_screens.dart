import 'dart:developer';

import 'package:amazon_clonee/resources/authenticatio_method.dart';
import 'package:amazon_clonee/screens/sign_in_screens.dart';
import 'package:amazon_clonee/utils/colors_themes.dart';
import 'package:amazon_clonee/utils/constant.dart';
import 'package:amazon_clonee/utils/utils.dart';
import 'package:amazon_clonee/widget/custom_main_botton.dart';
import 'package:amazon_clonee/widget/text_field.widget.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AuthenticationMethods authenticationMethods = AuthenticationMethods();
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    addressController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Center(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      amazonLogo,
                      height: screenSize.height * 0.10,
                    ),
                    SizedBox(
                      height: screenSize.height * 0.7,
                      child: FittedBox(
                        child: Container(
                          height: screenSize.height * 0.85,
                          width: screenSize.width * 0.8,
                          padding: const EdgeInsets.all(25),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Sign-Un",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 33),
                              ),
                              TextFieldWidget(
                                title: "Name",
                                controller: nameController,
                                obscureText: false,
                                hintText: "Enter your Name",
                              ),
                              TextFieldWidget(
                                title: "Address",
                                controller: addressController,
                                obscureText: false,
                                hintText: "Enter your Address",
                              ),
                              TextFieldWidget(
                                title: "Emails",
                                controller: emailController,
                                obscureText: false,
                                hintText: "Enter your emails",
                              ),
                              TextFieldWidget(
                                title: "Password",
                                controller: passwordController,
                                obscureText: true,
                                hintText: "Enter your password",
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: CustomMainBotton(
                                  color: yellowColor,
                                  isLoading: false,
                                  onPressed: () async {
                                    String output =
                                        await authenticationMethods.signUpUser(
                                            name: nameController.text,
                                            address: addressController.text,
                                            email: emailController.text,
                                            password: passwordController.text);
                                    if (output == "success") {
                                      log("doing next step");
                                    } else {
                                      //error
                                      Utils().showSnackBar(
                                          context: context, content: output);
                                    }
                                  },
                                  child: const Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        letterSpacing: 0.6,
                                        color: Colors.black),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    CustomMainBotton(
                        color: Colors.grey[400]!,
                        isLoading: false,
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return const SignInScreen();
                          }));
                        },
                        child: const FittedBox(
                          child: Text(
                            "Back Bottom",
                            softWrap: false,
                            // overflow: null,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                letterSpacing: 0.6, color: Colors.black),
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
