import 'package:civilbank/domain/cubit/authentication/cubit/cubit/authentication_cubit.dart';
import 'package:civilbank/view/loading.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:civilbank/constants.dart';
import 'package:civilbank/components/widgets/rounded.button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    AuthenticationCubit authCubit =
        BlocProvider.of<AuthenticationCubit>(context, listen:false);
    Widget buildLoadingState(BuildContext context) => const LoadingView();
    Widget loginForm() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: kTextFieldDecoration.copyWith(hintText: 'Enter Your E-mail',prefixIcon: const Icon(Icons.text_fields_outlined)),
              textAlign: TextAlign.center,
              controller: emailController,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              decoration:  kTextFieldDecoration.copyWith(hintText: 'Enter Your Password',prefixIcon: const Icon(Icons.password)),
              controller: passwordController,
            ),
            const SizedBox(
              height: 20,
            ),
            RoundedButton(
                title:'Log In',
                colour: Colors.lightBlueAccent,
                onPressed:()async{
                String email = emailController.text;
                String password = passwordController.text;
                authCubit.login(context: context,email:email, password:password);
            })
          ],
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('LogIn'),
        ),
        body: BlocListener<AuthenticationCubit, AuthenticationState>(
          listener: (context, state) {
            if(state is AuthenticationError){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(state.error)));
            }

            if(state is AuthenticationCompleted){

              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text("Login Successfully")));
            }
          },
          child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
            builder: (context, state) {
            if(state is AuthenticationLoading){
              return buildLoadingState(context);}
               return loginForm();
              }

          ),
        ));
  }


}
