import 'package:amazon_clonee/layout/screen_layout.dart';
import 'package:amazon_clonee/screens/sign_in_screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 1000), () {});
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, AsyncSnapshot<User?> user) {
            if (user.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.orange,
                ),
              );
            } else if (user.hasData) {
              return const ScreenLayout();
            } else {
              return const SignInScreen();
            }
          },
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: const Image(
            image: AssetImage('lib/assets/amaz.jpg'),
            fit: BoxFit.fill,
          )),
    );
  }
}
  // StreamBuilder(
  //           stream: FirebaseAuth.instance.authStateChanges(),
  //           builder: (context, AsyncSnapshot<User?> user) {
  //             if (user.connectionState == ConnectionState.waiting) {
  //               return const Center(
  //                 child: CircularProgressIndicator(
  //                   color: Colors.orange,
  //                 ),
  //               );
  //             } else if (user.hasData) {
  //               return const ScreenLayout();
  //             } else {
  //               return const SignInScreen();
  //             }
  //           },
  //         );