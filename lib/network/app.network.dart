// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:civilbank/app/routes/api.routes.dart';
import 'package:http/http.dart' as http;
class AppNetworkService{
  final client = http.Client();
  final headers={
    'Content-type':'application/json',
    'Accept':'application/json',
    "Access-Control-Allow-Origin":"*"
  };
  Future<dynamic>signup({
    required String name,
    required String email,
    required String password,
})async{
  final Uri uri = Uri.parse('${ApiRoutes.baseUri}/register');
  final http.Response response = await client.post(uri,
      body: jsonEncode({
        "name":name,
        "email":email,
        "password":password
      }),
      headers: headers,
  );
  final body = response.body;
  return body;
}
  Future<dynamic>login({
    required String email,
    required String password,
  })async{
    final Uri uri = Uri.parse('${ApiRoutes.baseUri}/login');
    final http.Response response = await client.post(uri,
      body: jsonEncode({
        "email":email,
        "password":password
      }),
      headers: headers,
    );
    final body = response.body;
    return body;
  }

  Future<dynamic> individualApplication({
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
  })async{
    final Uri uri = Uri.parse('${ApiRoutes.baseUri}/loanapp/individual');
    final http.Response response = await client.post(uri,
      body: jsonEncode({
        "name":name,
        "cnic":cnic,
        "contact_no":contactNo,
        "province":province,
        "loan_amount":loanAmount,
        "address":address,
        "date_of_birth":dateOfBirth,
        "loan_monthly_installment":loanMonthlyInstall,
        "district":district,
        "recordType":recordType,

      }),
      headers: headers
    );
    final body =response.body;
    return body;
  }
  Future<dynamic> businessApplication({
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
    required String businessEstablish,
    required String businessNature,
    required String businessTaxFile,

  })async{
    final Uri uri = Uri.parse('${ApiRoutes.baseUri}/loanapp/business');
    final http.Response response = await client.post(uri,
        body: jsonEncode({
          "name":name,
          "cnic":cnic,
          "contact_no":contactNo,
          "province":province,
          "loan_amount":loanAmount,
          "address":address,
          "date_of_birth":dateOfBirth,
          "loan_monthly_installment":loanMonthlyInstall,
          "district":district,
          "recordType":recordType,
          "business_name":businessName,
          "business_nature":businessNature,
          "business_establish":businessEstablish,
          "business_tax_file":businessTaxFile,
  }),
        headers: headers
    );
    final body =response.body;
    return body;
  }
  Future<dynamic> depositSlip({
    required String depositId,
    required double depositAmount,
    required String bankBranch,
    required String depositDatetime,
    required String borrowerName,
    required String borrowerId,
  })async{
    final Uri uri = Uri.parse('${ApiRoutes.baseUri}/loanapp/deposit');
    final http.Response response = await client.post(uri,
        body: jsonEncode({"depositId":depositId,
          "deposit_amount":depositAmount,
          "bank_branch":bankBranch,
          "deposit_datetime":depositDatetime,
          "borrower_name":borrowerName,
          "borrower_id":borrowerId,
        }),
        headers: headers
    );
    final body =response.body;
    return body;
  }


}