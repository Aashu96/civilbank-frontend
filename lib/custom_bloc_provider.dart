import 'package:civilbank/domain/cubit/authentication/cubit/cubit/authentication_cubit.dart';
import 'package:civilbank/main.dart';
import 'package:civilbank/model/repository/app.repository.dart';
import 'package:civilbank/network/app.network.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class Core extends StatelessWidget {
  const Core({super.key});
 @override 
 Widget build(BuildContext context){
  return MultiBlocProvider(
    providers: [
      BlocProvider<AuthenticationCubit>(
        create: (context) => AuthenticationCubit(repository: AppRepository(network: AppNetworkService())),
      ),],
    child:const CivilBank(),
  );
 }
}