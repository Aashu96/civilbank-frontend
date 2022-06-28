part of 'authentication_cubit.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}
class AuthenticationLoading extends AuthenticationState {}
class AuthenticationCompleted extends AuthenticationState {
  final dynamic response;
  AuthenticationCompleted({ required this.response});
}
class AuthenticationError extends AuthenticationState {
  final String error;
  AuthenticationError({required this.error});
}
