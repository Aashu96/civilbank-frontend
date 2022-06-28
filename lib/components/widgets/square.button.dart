// ignore_for_file: use_key_in_widget_constructors


import 'package:flutter/material.dart';

class SquareButton extends StatelessWidget {
  const SquareButton({required this.image,required this.label,this.onPressed});
final ImageProvider image;
final String? label;
final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return  Material(
      elevation: 3.0,
      borderRadius: BorderRadius.circular(10.0),
      child:MaterialButton(
        onPressed:onPressed,
        child: SizedBox(
          height: 150,
          width: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                color: Colors.blue,
                image: image,
                height: 80,
                width: 80,
              ),
              const SizedBox(height: 20),
              Text(label!,
              style: const TextStyle(
                fontSize: 15.0,
                color: Colors.blue
              ),)
            ],
          ),
        ),
      )
    );
  }
}
