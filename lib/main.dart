
import 'package:civilbank/app/routes/app.routes.dart';
import 'package:civilbank/custom_bloc_provider.dart';

import 'package:flutter/material.dart';

void main() {

  runApp(const Core());
}

class CivilBank extends StatelessWidget {
   const CivilBank({super.key});
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      theme:ThemeData(
        primaryColor: Colors.blue,
        inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
    ),
      )
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      onGenerateRoute: AppRoute.generateRoute,
    );
  }
}



