part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final UserCredential userCredential;

  AuthSuccess(this.userCredential);
}

class AuthError extends AuthState {
  final String errorMessage;

  AuthError(this.errorMessage);
}

