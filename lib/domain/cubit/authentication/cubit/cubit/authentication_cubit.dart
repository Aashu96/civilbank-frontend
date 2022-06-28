
// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:civilbank/model/repository/app.repository.dart';
import 'package:civilbank/network/app.network.dart';
import 'package:flutter/material.dart';
import 'package:cache_manager/cache_manager.dart';
part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AppRepository repository = AppRepository(network: AppNetworkService());
  AuthenticationCubit({required this.repository}) : super(AuthenticationInitial());


 Future<dynamic>signup({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
})async{
  try{
    emit(AuthenticationLoading());
    if(name.isNotEmpty && email.isNotEmpty && password.isNotEmpty){
        var response = await repository.signup(name: name, email: email, password: password);
    // ignore: avoid_print
    print(response);
    if(response !=null){
      emit(AuthenticationCompleted(response: response));
      Navigator.of(context).pushNamed('/login');
    }
    }
    else{
     emit(AuthenticationError(error: "Fill the Credentials")); 
    }
  }
  catch(e){
    emit(AuthenticationError(error:'Network Error'));
  }
}
Future<dynamic>login({
    required BuildContext context,
    required String email,
    required String password,
})async{
  try{
    emit(AuthenticationLoading());
    if(email.isNotEmpty && password.isNotEmpty){
        var response = await repository.login(email: email, password: password);
    // ignore: avoid_print
    print(response);
    if(response !=null){
      String jwt =response['jwt'];
      emit(AuthenticationCompleted(response:jwt));
      await WriteCache.setString(key: "jwt", value: jwt);
      Navigator.of(context).pushReplacementNamed('/home');
    }
    else{
      emit(AuthenticationError(error: "Invalid Credentials"));
    }
    }
    else{
     emit(AuthenticationError(error: "Fill the Credentials")); 
    }
  }
  catch(e){
    emit(AuthenticationError(error:"Network Error"));
  }
}
}
