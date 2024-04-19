import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../app/error/failures.dart';
import '../../../../../app/services/cache_service.dart';
import '../../../../../app/utils/get_it_injection.dart';
import '../../../../../app/utils/hanlders/error_state_handler.dart';
import '../../../../../app/utils/helper.dart';
import '../../../../../app/utils/navigation_helper.dart';
import '../../../../../app/widgets/custom_alert_dialog.dart';
import '../../../../bottom_navigation_feature/presentation/screens/bottom_navigation_screen.dart';
import '../../../domain/usecases/auth_usecases/signin_usecase.dart';
import '../../../domain/usecases/auth_usecases/signup_usecase.dart';
import '../../screens/signin_screen.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get() => BlocProvider.of(getIt<NavHelper>().navigatorKey.currentState!.context);
  bool reStartTimer = false;
  //sign i
  final signInPhoneController = TextEditingController();
  final passwordController = TextEditingController();
 // sign up
  final nameController = TextEditingController();
  final singUpPasswordController = TextEditingController();

  void signIn() async {
    emit(LoadingState());
    final response = await getIt<SignInUseCase>()(SignInUSeCaseParams(
      username: signInPhoneController.text,
        password: passwordController.text,),
    );
    response.fold(
      errorStateHandler,
          (r) {
        navigateTo(CliqueBottomNavigation(),removeAll: true);
      },
    );
    emit(AuthInitial());
  }

  void signUp() async {
    emit(SignUpLoadingState());
    final response = await getIt<SignUpUseCase>()(SignUpUSeCaseParams(
      username:nameController.text,
      password: singUpPasswordController.text,));
    response.fold(
        errorStateHandler,
          (r) {
          navigateTo(CliqueBottomNavigation(),removeAll: true);
      },
    );
    emit(AuthInitial());
  }

  void logOut() async {
    await getIt<CacheService>().clear();
    navigateTo(SignInScreen(),removeAll: true);
  }
}
