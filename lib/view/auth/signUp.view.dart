
import 'package:civilbank/constants.dart';
import 'package:civilbank/domain/cubit/authentication/cubit/cubit/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/cubit/authentication/cubit/cubit/authentication_cubit.dart';
import 'package:civilbank/components/widgets/rounded.button.dart';

import '../loading.view.dart';
class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    Widget buildLoadingState(BuildContext context) => const LoadingView();
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    AuthenticationCubit authCubit =
    BlocProvider.of<AuthenticationCubit>(context, listen:true);
    Widget signUp(){
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              textAlign: TextAlign.center,
              decoration: kTextFieldDecoration.copyWith(hintText: 'Enter Your Name',prefixIcon: const Icon(Icons.text_fields_rounded)),
              controller: nameController,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              decoration: kTextFieldDecoration.copyWith(hintText: 'Enter Your E-mail'),
              controller: emailController,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              textAlign: TextAlign.center,
              obscureText: true,
              decoration: kTextFieldDecoration.copyWith(hintText: 'Enter Your Password',prefixIcon: const Icon(Icons.password)),
              controller: passwordController,
            ),
            const SizedBox(
              height: 20,
            ),
            RoundedButton(
                title:'Register',
                colour: Colors.blueAccent,
                onPressed:()async{
                  String name= nameController.text;
                  String email = emailController.text;
                  String password = passwordController.text;
                  authCubit.signup(context: context,name: name,email:email, password:password);
                })
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body:BlocListener<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if(state is AuthenticationError){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(state.error)));
          }
          if(state is AuthenticationCompleted){

            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text("Registered Successfully")));
          }
        },
        child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
          builder: (context, state) {
              if(state is AuthenticationLoading){
                return buildLoadingState(context);
              }
            return signUp();

          },
        ),
      )
    );
  }
}
