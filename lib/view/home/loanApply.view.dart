import 'package:civilbank/components/widgets/custom.appBar.dart';
import 'package:flutter/material.dart';
import '../../components/widgets/square.button.dart';
class LoanApplyView extends StatelessWidget {
   const LoanApplyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Loan Apply') ,
        actions: const [
          LogOutButton()
        ],
        ),body: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SquareButton(
              onPressed: () {
                Navigator.pushNamed(context,'/individual_form');
              },
              image: const AssetImage('assets/individual.png'),
              label: 'Individual'),
          const SizedBox(
            width: 20,
          ),
          SquareButton(
              onPressed: () => Navigator.pushNamed(context,'/business_form'),
              image: const AssetImage('assets/company.png'),
              label: 'Business')
        ],
      ),
    ),
    );

  }
}
