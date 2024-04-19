import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../app/error/failures.dart';
import '../../../../../app/usecase/usecase.dart';
import '../../../data/model/user_model.dart';
import '../../repo/auth_repo.dart';

class SignInUseCase implements UseCase<UserModel, SignInUSeCaseParams> {
  final AuthRepo repository;

  SignInUseCase({required this.repository});

  @override
  Future<Either<Failure, UserModel>> call(SignInUSeCaseParams params) async{
    return await repository.signIn(params.toMap());
  }

}

class SignInUSeCaseParams {
  final String username;
  final String password;
  SignInUSeCaseParams(
      {
        required this.username,
        required this.password,
      });

  Map<String, String> toMap() {
    final map = {
      "username": username,
      "password": password,
    };
    return map;
  }
}
