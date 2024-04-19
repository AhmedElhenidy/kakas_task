part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthVisiblePasswordState extends AuthState {
  final bool isVisible;
  const AuthVisiblePasswordState(this.isVisible);
  @override
  List<Object?> get props => [isVisible];
}
class SignUpVisiblePasswordState extends AuthState {
  @override
  List<Object?> get props => [];
}
class AuthVisibleNewPasswordState extends AuthState {
  @override
  List<Object?> get props => [];
}
class AuthVisibleOldPasswordState extends AuthState {
  @override
  List<Object?> get props => [];
}
class LoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}
class SignUpLoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}
class VerifyLoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}