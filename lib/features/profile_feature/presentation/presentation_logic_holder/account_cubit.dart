import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../app/utils/get_it_injection.dart';
import '../../../../../app/utils/navigation_helper.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(AccountInitial());
  static AccountCubit get(context) => BlocProvider.of(getIt<NavHelper>().navigatorKey.currentState!.context);
  bool passObscure = true;
  String? terms;

  void changeVisible(){
    passObscure = !passObscure;
    emit(AccountVisiblePasswordState(passObscure));
  }


}
