import 'package:dartz/dartz.dart';

import '../../../../../app/error/failures.dart';
import '../../../../../app/usecase/usecase.dart';
import '../../../data/model/user_model.dart';
import '../../repo/auth_repo.dart';

class SignUpUseCase implements UseCase<UserModel, SignUpUSeCaseParams> {
  final AuthRepo repository;

  SignUpUseCase({required this.repository});

  @override
  Future<Either<Failure, UserModel>> call(SignUpUSeCaseParams params) async{
    return await repository.signUp(params.toMap());
  }

}

class SignUpUSeCaseParams {
  final String username;
  final String password;

  SignUpUSeCaseParams(
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
