// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:civilbank/network/app.network.dart';
class AppRepository{
   AppNetworkService network = AppNetworkService();
   AppRepository({required this.network});
  Future<dynamic>signup({
    required String name,
    required String email,
    required String password,
})async{
  var response = await network.signup(name: name, email: email, password: password);
  final Map<String,dynamic> parseData = jsonDecode(response);
  print(parseData);
  return parseData;
}
  Future<dynamic>login({
    required String email,
    required String password,
  })async{
 var response = await network.login( email: email, password: password);
  final Map<String,dynamic> parseData = jsonDecode(response);
  print(parseData);
  return parseData;
  }
   Future<dynamic>individualApplicationRepo({
     required String name,
     required String cnic,
     required String contactNo,
     required String province,
     required int loanAmount,
     required String address,
     required String dateOfBirth,
     required double loanMonthlyInstall,
     required String district,
     required String recordType

})async{
  var response = await network.individualApplication(
      name: name,
      cnic: cnic,
      contactNo:contactNo,
      province:province,
      loanAmount: loanAmount,
      address:address,
      dateOfBirth: dateOfBirth,
      loanMonthlyInstall: loanMonthlyInstall,
      district: district ,
      recordType:recordType);
  final Map<String,dynamic> parseData = jsonDecode(response);
  print(parseData);
  return parseData;
}
   Future<dynamic>businessApplicationRepo({
     required String name,
     required String cnic,
     required String contactNo,
     required String province,
     required int loanAmount,
     required String address,
     required String dateOfBirth,
     required double loanMonthlyInstall,
     required String district,
     required String recordType,
     required String businessName,
     required String businessNature,
     required String businessTaxFile,
     required String businessEstablish

   })async{
     var response = await network.businessApplication(
          name: name,
          cnic: cnic,
          contactNo:contactNo,
          province:province,
          loanAmount: loanAmount,
          address:address,
          dateOfBirth: dateOfBirth,
          loanMonthlyInstall:loanMonthlyInstall,
          district: district ,
          recordType:recordType,
          businessName:businessName ,
          businessNature: businessNature,
          businessTaxFile:businessTaxFile,
          businessEstablish: businessEstablish,

     );
     final Map<String,dynamic> parseData = jsonDecode(response);
     print(parseData);
     return parseData;
   }

   Future<dynamic>depositRepo({
     required String depositId,
     required double depositAmount,
     required String bankBranch,
     required String depositDatetime,
     required String borrowerName,
     required String borrowerId,
   })async{
     var response = await network.depositSlip(
         depositId:depositId,
         depositAmount: depositAmount,
         depositDatetime: depositDatetime,
         bankBranch: bankBranch,
         borrowerId:borrowerId,
         borrowerName: borrowerName
     );
   final Map<String,dynamic> parseData = jsonDecode(response);
   print(parseData);
   return parseData;
   }
}