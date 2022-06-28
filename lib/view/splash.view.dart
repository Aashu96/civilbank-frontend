import 'dart:async';

import 'package:cache_manager/cache_manager.dart';
import 'package:flutter/material.dart';
class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);
  
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  Future _initiateCache()async{
    CacheManagerUtils.conditionalCache(
      key: "jwt", 
      valueType: ValueType.StringValue,
      actionIfNull: (){
        Navigator.of(context).pushNamed('/welcome');
      },
      actionIfNotNull:(){
        Navigator.of(context).pushNamed('/home');
      } 
      );
  }
  @override
  void initState() {
    Timer(const Duration(seconds: 4),_initiateCache);
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png',
              height: 250,
              width: 250,
            ),
            const SizedBox(height: 80,),
            const CircularProgressIndicator(
              color: Colors.black,
            )
          ],
        ),
      ));
  }
}
