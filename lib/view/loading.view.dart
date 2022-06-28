
import 'package:flutter/material.dart';
class LoadingView extends StatelessWidget {
 // ignore: use_key_in_widget_constructors
 const LoadingView();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Container(
          width: 80,
          height: 80,
          padding: const EdgeInsets.all(12.0),
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
