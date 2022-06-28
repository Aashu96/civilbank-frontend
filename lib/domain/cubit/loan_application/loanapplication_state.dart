// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'loanapplication_cubit.dart';

@immutable
abstract class LoanApplicationState {}
class LoanFormState extends LoanApplicationState {}
class LoanApplicationLoadingState extends LoanApplicationState {}
class LoanApplicationSuccess extends LoanApplicationState {
  final dynamic response;
  LoanApplicationSuccess({this.response});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is LoanApplicationSuccess &&
      other.response == response;
  }

  @override
  int get hashCode => response.hashCode;
}
class LoanApplicationError extends LoanApplicationState {
  final String? error;
  LoanApplicationError({this.error});


  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is LoanApplicationError &&
      other.error == error;
  }

  @override
  int get hashCode => error.hashCode;
}
