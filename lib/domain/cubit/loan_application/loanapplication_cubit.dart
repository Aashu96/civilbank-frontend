

// ignore_for_file: avoid_print, unnecessary_null_comparison


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../model/repository/app.repository.dart';
import '../../../network/app.network.dart';

part 'loanapplication_state.dart';

 class LoanApplicationCubit extends Cubit<LoanApplicationState> {

AppRepository repository = AppRepository(network: AppNetworkService());

  LoanApplicationCubit({required this.repository}) : super(LoanFormState());

final  DateFormat formatter = DateFormat('yyyy-MM-dd');
final DateFormat datetimeFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
Future<dynamic>individualApplication({
    required BuildContext context,
    required String name,
    required String cnic,
    required String contactNo,
    required String province,
    required int loanAmount,
    required String address,
    required DateTime dateOfBirth,
    required String loanMonthlyInstall,
    required String district,

 })async{

  try{
    emit(LoanApplicationLoadingState());
    final date = formatter.format(dateOfBirth);
     var response=  await repository.individualApplicationRepo(
         name:name,
         cnic: cnic,
         contactNo: contactNo,
         province: province,
         loanAmount:loanAmount,
         address:address,
         dateOfBirth: date,
         loanMonthlyInstall: double.parse(loanMonthlyInstall),
         district: district,
         recordType:'0125g0000007XVYAA2'
     );
      print(response);
      if(response != null){
        int id=response['id'];
      emit(LoanApplicationSuccess(response:id));
      }
      else{
      emit(LoanApplicationError(error: "Issue 404 Cannot Submit"));
      }
  }
  catch(e){
      emit(LoanApplicationError(error:"Error! Cannot be submitted"));
  }  
    }

Future<dynamic>businessApplication({
  required BuildContext context,
  required String name,
  required String cnic,
  required String contactNo,
  required String province,
  required int loanAmount,
  required String address,
  required DateTime dateOfBirth,
  required String loanMonthlyInstall,
  required String district,
  required String businessName,
  required String businessNature,
  required String businessTaxFile,
  required DateTime businessEstablish

})async{

   try{
     emit(LoanApplicationLoadingState());
    String dOB = formatter.format(dateOfBirth);
    String busEstablish = formatter.format(businessEstablish);
      var response = await repository.businessApplicationRepo(
          name: name,
          cnic: cnic,
          contactNo: contactNo,
          province: province,
          loanAmount:loanAmount,
          address: address,
          dateOfBirth: dOB,
          loanMonthlyInstall: double.parse(loanMonthlyInstall),
          district: district,
          recordType: '0125g0000007XVdAAM',
          businessName: businessName,
          businessNature: businessNature,
          businessTaxFile: businessTaxFile,
          businessEstablish: busEstablish
      );
      if (response != null) {
        int id=response['id'];
        emit(LoanApplicationSuccess(response:id));
      }
      else {
        emit(LoanApplicationError(error: "Issue 404 Cannot Submit"));
      }
    }
    catch(e){
    emit(LoanApplicationError(error:"Error! Cannot be submitted"));
  }
}

Future<dynamic>depositSlip({
  required BuildContext context,
  required String depositId,
  required String depositAmount,
  required String bankBranch,
  required DateTime depositDatetime,
  required String borrowerName,
  required String borrowerId,

})async{
  try{
    emit(LoanApplicationLoadingState());
    String depositDT = datetimeFormat.format(depositDatetime);
      var response = await repository.depositRepo(
          depositId:depositId,
          depositAmount:double.parse(depositAmount),
          depositDatetime:depositDT,
          bankBranch:bankBranch,
          borrowerName: borrowerName,
          borrowerId: borrowerId
          );
      if (response != null) {
        emit(LoanApplicationSuccess(response: "Successfully Submitted"));
      }

  }catch(e){
    emit(LoanApplicationError(error:"Network Error! Cannot be submitted"));
  }
}


    }








