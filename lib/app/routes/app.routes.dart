import 'package:civilbank/pages/business.page.dart';
import 'package:civilbank/pages/deposit.page.dart';
import 'package:civilbank/pages/individual.page.dart';
import 'package:civilbank/view/auth/login.view.dart';
import 'package:civilbank/view/home/home.view.dart';
import 'package:civilbank/view/home/loanApply.view.dart';

import 'package:civilbank/view/splash.view.dart';
import 'package:civilbank/view/welcome.view.dart';
import 'package:flutter/material.dart';

import '../../view/auth/signUp.view.dart';


class AppRoute{
  static Route? generateRoute(RouteSettings settings){
    switch(settings.name)
    {
      case '/splash':
      return MaterialPageRoute(builder: (_)=>const SplashView());
      case '/welcome':
        return MaterialPageRoute(builder: (_)=>const WelcomeView());
      case '/login':
        return MaterialPageRoute(builder: (_)=>const LoginView());
      case '/signup':
        return MaterialPageRoute(builder: (_)=>const SignUpView());
      case '/home':
        return MaterialPageRoute(builder: (_)=>const HomeView());
      case '/loanApply':
        return MaterialPageRoute(builder: (_)=>const LoanApplyView());
      case '/depositSlip':
        return MaterialPageRoute(builder: (_)=>const DepositPage());
      case '/individual_form':
        return MaterialPageRoute(builder: (_)=>const IndividualPage());
      case '/business_form':
        return MaterialPageRoute(builder: (_)=>const BusinessPage());
    }
    return null;

  }
}