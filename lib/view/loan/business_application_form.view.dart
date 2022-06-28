// ignore_for_file: camel_case_types, must_be_immutable

import 'package:civilbank/components/widgets/custom.appBar.dart';
import 'package:civilbank/domain/cubit/loan_application/loanapplication_cubit.dart';
import 'package:civilbank/view/loading.view.dart';
import 'package:civilbank/view/success.view.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../components/widgets/rounded.button.dart';
import '../../constants.dart';
class BusinessForm extends StatelessWidget {
  BusinessForm({Key? key}) : super(key: key);


 TextEditingController businessNameController=TextEditingController();

  // ignore: prefer_typing_uninitialized_variables
  String? provinceValue;
  TextEditingController businessNatureController=TextEditingController();
  dynamic datOfBirth;
  String? name;
  String? cnic;
  String? contactNo;
  int? loanAmount;
  String? address;
  String? loanInstall;
  dynamic businessEstablish;
  String? district;
  final format = DateFormat("yyyy-MM-dd");
  TextEditingController businessTaxController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    LoanApplicationCubit businessCubit = BlocProvider.of<LoanApplicationCubit>(context);
    Widget buildLoading(BuildContext context)=>const LoadingView();
    Widget buildSuccess(BuildContext context,int id)=>SuccessScreen(id:id,isVisible: true,);
    Widget buildBusinessForm() {
      return SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal:10 ),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                      onChanged: (val)=>name=val,
                      textAlign: TextAlign.start,
                      decoration:kTextFieldDecoration.copyWith(hintText: 'Name',prefixIcon: const Icon(Icons.text_fields))
                  ),
                  const SizedBox(height: 20,),
                  DateTimeField(
                    decoration: kTextFieldDecoration.copyWith(hintText: 'Date Of Birth',prefixIcon: const Icon(Icons.date_range_rounded)),
                    format: format,
                    onShowPicker: (context, currentValue) async{
                      final date=  await showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate: currentValue ?? DateTime.now(),
                          lastDate: DateTime(2100));
                      return datOfBirth= date;
                    },
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    onChanged: (value)=>cnic=value,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.start,
                    decoration:kTextFieldDecoration.copyWith(hintText: 'CNIC',prefixIcon: const Icon(Icons.numbers)),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    onChanged: (val)=>contactNo=val,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.start,
                    decoration:kTextFieldDecoration.copyWith(hintText: 'Contact Number',prefixIcon: const Icon(Icons.phone), ),
                  ),
                  const SizedBox(height: 20,),
                  DropdownButtonFormField(
                    decoration: kTextFieldDecoration.copyWith(hintText:"Province",prefixIcon: const Icon(Icons.location_on)),
                    items: <String>['Sindh', 'Punjab', 'Balochistan', 'KPK'].map((String value) {
                      return DropdownMenuItem<String>(value: value,
                          child: Text(value)
                      );
                    }).toList(),
                    onChanged: (value){
                      provinceValue=value.toString();
                    },
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField(
                    decoration: kTextFieldDecoration.copyWith(hintText:"District",prefixIcon: const Icon(Icons.location_city_rounded)),
                    items: <String>['Bannu',
                      'Quetta',
                      'Dera Ismail Khan',
                      'Karachi',
                      'Lahore',
                      'Multan',
                      'Sibi',
                      'Sukkur'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      district = value.toString();
                    },
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                      maxLines:2,
                      onChanged: (val)=>address=val,
                      textAlign: TextAlign.start,
                      decoration:kTextFieldDecoration.copyWith(hintText: 'Address',prefixIcon: const Icon(Icons.location_history))
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    onChanged: (val)=>loanAmount=int.parse(val),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    textAlign: TextAlign.start,
                    decoration:kTextFieldDecoration.copyWith(hintText: 'Loan Amount',prefixIcon: const Icon(Icons.money_off)),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    onChanged: (val)=>loanInstall=val,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    textAlign: TextAlign.start,
                    decoration:kTextFieldDecoration.copyWith(hintText: 'Loan Installments',prefixIcon: const Icon(Icons.format_list_numbered)),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                      decoration:const BoxDecoration(
                          border:Border(
                            bottom: BorderSide(width: 2.0, color: Colors.blue),
                          )
                      ) ,
                      child: const Center(child: Text('Business Information'))),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: businessNameController,
                    textAlign: TextAlign.start,
                    decoration:kTextFieldDecoration.copyWith(hintText: 'Business Name',prefixIcon: const Icon(Icons.business_center)),

                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: businessNatureController,
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    decoration:kTextFieldDecoration.copyWith(hintText: 'Business Nature',prefixIcon: const Icon(Icons.business_center)),

                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    keyboardType: TextInputType.number,

                    controller: businessTaxController,
                    textAlign: TextAlign.start,
                    decoration:kTextFieldDecoration.copyWith(hintText: 'Business Tax File Number',prefixIcon: const Icon(Icons.business_center)),

                  ),
                  const SizedBox(height: 20,),
                  DateTimeField(
                    decoration: kTextFieldDecoration.copyWith(hintText:'Business Established Date',prefixIcon: const Icon(Icons.date_range_rounded)),
                    format: format,
                    onShowPicker: (context, currentValue)async{
                      final date= await showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate: currentValue ?? DateTime.now(),
                          lastDate: DateTime(2100));
                      return businessEstablish=date;
                    },),
                  const SizedBox(height: 20,),
                  RoundedButton(
                      title:'Submit',
                      colour:Colors.blueAccent,
                      onPressed:()async {
                        if (name!=null && cnic!=null &&
                            contactNo!=null && loanAmount!=null &&
                            address!=null && loanInstall!=null &&
                            provinceValue!=null && district!=null
                            && datOfBirth != null && businessNameController.text.isNotEmpty &&
                            businessNatureController.text.isNotEmpty
                            && businessTaxController.text.isNotEmpty &&
                            businessEstablish != null) {
                          if (cnic
                              .toString()
                              .length != 13) {
                            return showError(
                                context, "CNIC Number should be 13 digits");
                          }
                          else if (contactNo
                              .toString()
                              .length != 11) {
                            return showError(
                                context, "Contact Number should be 11 digits");
                          }
                          else if ((loanAmount ?? 0) < 100000 ||
                              (loanAmount ?? 0) > 500000) {
                            return showError(
                                context, "Amount must be 10000 to 50000");
                          }
                          else {
                            businessCubit.businessApplication(
                                context: context,
                                name: name!,
                                cnic: cnic!,
                                contactNo: contactNo!,
                                province: provinceValue!,
                                loanAmount: loanAmount!,
                                address: address!,
                                dateOfBirth: datOfBirth!,
                                loanMonthlyInstall: loanInstall!,
                                district: district!,
                                businessName: businessNameController.text,
                                businessNature: businessNatureController.text,
                                businessTaxFile: businessTaxController.text,
                                businessEstablish: businessEstablish
                            );
                          }
                        }
                        else{
                          showError(context,"Complete the values");
                        }
                      }
                  )
                ],
              )
          )
      );
    }

    return  Scaffold(
        appBar:AppBar(
          title: const Text('Business Loan'),
          actions: const [
            LogOutButton()
          ],
        ),
        body:BlocConsumer<LoanApplicationCubit,LoanApplicationState>(
          listener:(context,state){
            if(state is LoanApplicationError) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error!)));
            }
            },
            builder: (context,state){
              if(state is LoanApplicationLoadingState){
                return buildLoading(context);
              }
              if(state is LoanApplicationSuccess){
                return buildSuccess(context,state.response);
              }
              return buildBusinessForm();
            }
          ),
    );
  }
}
Future showError(BuildContext context,String error){
  return showDialog(
      context: context,
      builder:(_)=>AlertDialog(
        title: const Text('Error'),
        content: Text(error),
      ));
}

