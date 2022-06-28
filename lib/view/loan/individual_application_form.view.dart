// ignore_for_file: camel_case_types, must_be_immutable, unrelated_type_equality_checks

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:civilbank/components/widgets/custom.appBar.dart';
import 'package:civilbank/domain/cubit/loan_application/loanapplication_cubit.dart';
import 'package:civilbank/view/loading.view.dart';
import 'package:civilbank/view/success.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../components/widgets/rounded.button.dart';
import '../../constants.dart';
import 'package:flutter/services.dart';

class IndividualForm extends StatelessWidget {
  const IndividualForm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LoanApplicationCubit individualCubit =BlocProvider.of(context);
      String? address;
      String? loanInstall;
      String? name;
      String? cnic;
      String? contactNo;
      int? loanAmount;
      DateTime? dateOfBirth;
      String? provinceValue;
      String? district;
    final format = DateFormat("yyyy-MM-dd");
    Widget buildLoading(BuildContext context)=>const LoadingView();
    Widget buildSuccess(BuildContext context,int id)=>SuccessScreen(id:id,isVisible: true,);
      Widget buildIndividualLoan(BuildContext context) {
      return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal:10 ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                    onChanged:(val){
                      name=val;
                    },
                    textAlign: TextAlign.start,
                    decoration:kTextFieldDecoration.copyWith(hintText: 'Name',prefixIcon: const Icon(Icons.text_fields) )
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
                    return dateOfBirth = date;
                  },
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  onChanged: (val){
                    cnic=val;
                  },
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.start,
                  decoration:kTextFieldDecoration.copyWith(hintText: 'CNIC',prefixIcon: const Icon(Icons.numbers)),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  keyboardType: TextInputType.number,
                  onChanged: (val){
                    contactNo=val;
                  },
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
                    onChanged: (val){
                      address=val.toString();
                    },
                    textAlign: TextAlign.start,
                    decoration:kTextFieldDecoration.copyWith(hintText: 'Address',prefixIcon: const Icon(Icons.location_history))
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  onChanged:(value){
                    loanAmount=int.tryParse(value);

                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  textAlign: TextAlign.start,
                  decoration:kTextFieldDecoration.copyWith(hintText: 'Loan Amount',prefixIcon: const Icon(Icons.money_off)),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  onChanged: (val){
                    loanInstall=val;
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  textAlign: TextAlign.start,
                  decoration:kTextFieldDecoration.copyWith(hintText: 'Loan Installments',prefixIcon: const Icon(Icons.format_list_numbered)),
                ),

                RoundedButton(
                    title:'Submit',
                    colour:Colors.blueAccent,
                    onPressed:()async {
                      if (name!=null && cnic!= null && contactNo!=null && loanAmount != null &&
                          address != null&& dateOfBirth != null && loanInstall!=null && district != null && provinceValue != null) {
                        if(cnic.toString().length !=13){
                           return showError(context, "CNIC Number should be 13 digits");
                        }
                        else if(contactNo.toString().length!=11){
                          return showError(context, "Contact Number should be 11 digits");
                        }
                        else if((loanAmount??0)<10000 ||(loanAmount??0)>50000){
                          return showError(context,"Amount must be 10000 to 50000");
                        }
                        else{
                    
                          individualCubit.individualApplication(
                              context: context,
                              name: name??"",
                              cnic: cnic??"",
                              contactNo: contactNo??"",
                              province: provinceValue ?? "",
                              loanAmount:loanAmount!,
                              address: address??"",
                              dateOfBirth: dateOfBirth as DateTime,
                              loanMonthlyInstall: loanInstall??"",
                              district: district ?? "");
                        }
                      }
                      else {
                        showError(context,"Complete the Fields");
                      }

                    }
          )
              ],
            ),
          )
      );
    }
    return Scaffold(
        appBar:AppBar(
          title: const Text('Individual Loan'),
          actions: const [
            LogOutButton()
          ],
        ),
        body:BlocListener<LoanApplicationCubit,LoanApplicationState>(
          listener: (context,state){
            if(state is LoanApplicationError){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('${state.error}')));
            }
            },
          child: BlocBuilder<LoanApplicationCubit,LoanApplicationState>(
              bloc: BlocProvider.of<LoanApplicationCubit>(context),
              builder: (context,state){
                if(state is LoanApplicationLoadingState){
                  return buildLoading(context);}
                if(state is LoanApplicationSuccess){
                  return buildSuccess(context,state.response);
                }
                return buildIndividualLoan(context);
              }
          ),
        )
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
