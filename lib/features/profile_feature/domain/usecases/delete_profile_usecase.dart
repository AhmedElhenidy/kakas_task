import 'package:dartz/dartz.dart';

import '../../../../app/error/failures.dart';
import '../../../../app/usecase/usecase.dart';
import '../../../auth_feature/data/model/user_model.dart';
import '../repo/account_repo.dart';

class DeleteAccountUseCase implements UseCase<String, NoParams> {
  final AccountRepo repository;

  DeleteAccountUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(NoParams params) async{
    return await repository.deleteAccount();
  }
}

