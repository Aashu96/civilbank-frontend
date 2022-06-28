

import 'package:flutter/material.dart';
import 'package:civilbank/components/widgets/rounded.button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
class WelcomeView extends StatefulWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Center(
            child: SizedBox(
              height: 80,
              child: AnimatedTextKit(
                  repeatForever:true,
                  animatedTexts:[FlickerAnimatedText('CivilBank',textStyle: const TextStyle(fontSize: 45.0,fontWeight: FontWeight.bold))],
              ),
            ),
          ),
            RoundedButton(
              title: 'Register',
              colour: Colors.blueAccent,
              onPressed: () {
                Navigator.of(context).pushNamed('/signup');
              },
            ),

          RoundedButton(
          title: 'Log In',
          colour: Colors.lightBlueAccent,
          onPressed: () {
            Navigator.of(context).pushNamed('/login');
          },
        ),
        ]),
      ),
    );
  }
}
