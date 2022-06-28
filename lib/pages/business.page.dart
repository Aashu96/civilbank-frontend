import 'package:civilbank/view/loan/business_application_form.view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/cubit/loan_application/loanapplication_cubit.dart';
import '../model/repository/app.repository.dart';
import '../network/app.network.dart';

class BusinessPage extends StatelessWidget {
  const BusinessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoanApplicationCubit>(
        create: (_) => LoanApplicationCubit(repository: AppRepository(network: AppNetworkService()))
    ,child: BusinessForm());
  }
}
