// ignore_for_file: use_key_in_widget_constructors, unused_local_variable

import 'package:civilbank/components/widgets/square.button.dart';


import 'package:flutter/material.dart';


import '../../components/widgets/custom.appBar.dart';



class HomeView extends StatefulWidget {
  const HomeView();

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          automaticallyImplyLeading:false,
          title: const Text('CivilBank'),
          actions: const [
            LogOutButton()
          ],
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SquareButton(
                  onPressed: (){
                    Navigator.pushNamed(context,'/loanApply');
                  },
                  image: const AssetImage('assets/loan.png'),
                  label: 'Apply Loan '),
              const SizedBox(
                width: 20,
              ),
              SquareButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/depositSlip');
                },
             image: const AssetImage('assets/deposit.png'), label: 'Deposit Slip'
              ),
            ],
          ),
        )

    );
  }
}

