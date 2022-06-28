import 'package:civilbank/view/loan/individual_application_form.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/cubit/loan_application/loanapplication_cubit.dart';
import '../model/repository/app.repository.dart';
import '../network/app.network.dart';
class IndividualPage extends StatelessWidget {
  const IndividualPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoanApplicationCubit>(
    create: (_) => LoanApplicationCubit(repository: AppRepository(network: AppNetworkService())),
      child: const IndividualForm(),
    );
  }
}
