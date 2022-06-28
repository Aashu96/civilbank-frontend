// ignore_for_file: must_be_immutable

import 'package:civilbank/components/widgets/custom.appBar.dart';
import 'package:civilbank/components/widgets/rounded.button.dart';
import 'package:civilbank/domain/cubit/loan_application/loanapplication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants.dart';
import 'package:intl/intl.dart';

import '../loading.view.dart';
import '../success.view.dart';
class DepositSlipForm extends StatelessWidget {
  DepositSlipForm({Key? key}) : super(key: key);
    DateTime? depositDateTime;
    String? bankBranch;
    final format = DateFormat("yyyy-MM-dd HH:mm");

  @override
  Widget build(BuildContext context) {
    LoanApplicationCubit depositCubit = BlocProvider.of<LoanApplicationCubit>(context);
    TextEditingController depositAmountController =TextEditingController();
    TextEditingController  depositIDController =TextEditingController();
    TextEditingController borrowerName= TextEditingController();
    TextEditingController borrowerID = TextEditingController();

    Widget buildLoading(BuildContext context)=>const LoadingView();
    Widget buildSuccess(BuildContext context)=>SuccessScreen(isVisible: false,);
    Widget buildDepositForm(BuildContext context){
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: depositIDController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              textAlign: TextAlign.start,
              decoration:kTextFieldDecoration.copyWith(hintText: 'Deposit ID',prefixIcon: const Icon(Icons.numbers_rounded)),
            ),
            const SizedBox(height: 20,),

            TextFormField(
              controller: depositAmountController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              textAlign: TextAlign.start,
              decoration:kTextFieldDecoration.copyWith(hintText: 'Deposit Amount',prefixIcon: const Icon(Icons.money_off)),
            ),
            const SizedBox(height: 20,),
            DateTimeField(
              decoration: kTextFieldDecoration.copyWith(hintText:'Deposit Date Time',prefixIcon: const Icon(Icons.date_range_rounded)),
              format: format,
              onShowPicker: (context, currentValue) async {
                final date = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100));
                if (date != null) {
                  final time = await showTimePicker(
                    context: context,
                    initialTime:
                    TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                  );
                   depositDateTime= DateTimeField.combine(date, time);
                   return depositDateTime;
                } else {
                  return currentValue;
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            DropdownButtonFormField(
              decoration: kTextFieldDecoration.copyWith(hintText:"Bank Branch",prefixIcon: const Icon(Icons.money_sharp)),
              items: <String>['Karachi Main Branch', 'Karachi Saddar','Sukkur Marich Bazar', 'Sukkur Shahi Bazar', 'Multan Cantt',
                'Vehari Chowk Multan', 'Lahore Town Ship', 'Lahore Shadman Colony', 'Circular Road D.I Khan',
                'Tank Adda D.I Khan', 'Liaquat Bazar Sibi', 'Bannu City Branch', 'Toghi Road Quetta'
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                bankBranch=value.toString();
              },
            ),
            const SizedBox(height: 20,),
            TextFormField(
              controller:borrowerName,
              textAlign: TextAlign.start,
              decoration:kTextFieldDecoration.copyWith(hintText: 'Borrower First Name',prefixIcon: const Icon(Icons.text_fields)),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller:borrowerID,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              textAlign: TextAlign.start,
              decoration:kTextFieldDecoration.copyWith(hintText: 'Borrower ID',prefixIcon: const Icon(Icons.numbers_rounded)),
            ),
            RoundedButton(
                title:'Submit',
                colour:Colors.blueAccent,
                onPressed:()async{
                  if (depositIDController.text.isNotEmpty && depositAmountController.text.isNotEmpty && bankBranch!=null && depositDateTime!=null
                      &&  borrowerName.text.isNotEmpty && borrowerID.text.isNotEmpty ){
                    depositCubit.depositSlip(
                     context: context,
                     depositId: depositIDController.text,
                     depositAmount:depositAmountController.text,
                     bankBranch:bankBranch!,
                     depositDatetime:depositDateTime!,
                     borrowerName:borrowerName.text,
                        borrowerId:borrowerID.text);
                  }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Complete the fields")));
                  }
                  }
            )
          ],
        ),
      );
    }


    return Scaffold(
      appBar: AppBar(
        title: const Text('Deposit Slip'),
        actions: const [LogOutButton()
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
                return buildSuccess(context);}
              return buildDepositForm(context);
            }
        ),
      )
    );
  }
}
