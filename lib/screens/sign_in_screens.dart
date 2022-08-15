import 'package:amazon_clonee/utils/constant.dart';
import 'package:amazon_clonee/utils/utils.dart';
import 'package:amazon_clonee/widget/custom_main_botton.dart';
import 'package:amazon_clonee/widget/text_field.widget.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Scaffold(
      body: Padding(
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
                Container(
                  height: screenSize.height * 0.6,
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
                        "Sign-In",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 33),
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
                        obscureText: false,
                        hintText: "Enter your password",
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: CustomMainBotton(
                          color: Colors.orange,
                          isLoading: false,
                          onPressed: () {},
                          child: const Text(
                            "Sign In",
                            style: TextStyle(letterSpacing: 0.6),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                CustomMainBotton(
                    color: Colors.green[400]!,
                    isLoading: false,
                    onPressed: () {},
                    child: const Text(
                      "create an Amazon Account",
                      style: TextStyle(letterSpacing: 0.6),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
