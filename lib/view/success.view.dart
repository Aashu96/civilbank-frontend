
// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  SuccessScreen({this.id,required this.isVisible});
 bool isVisible = false;
 final id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:buildSuccess()
    );
  }
  Center buildSuccess(
      ) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[
          const Image(image:AssetImage('assets/success.png'),height: 100,width: 100,),
          const SizedBox(height: 10),
          const Text(
            'Success',
            style: TextStyle(fontSize: 54, color: Colors.green),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20,),
          const Center(child: Text('You have Successfully Submitted',style: TextStyle(color: Colors.lightGreen,fontSize:22),)),
          const SizedBox(height:10 ,),
            Visibility(
              visible: isVisible,
              child: Text('Your ID Number:$id',
                style: const TextStyle(fontSize: 20, color: Colors.red),),
            )

        ],
      ),
    );
  }
}