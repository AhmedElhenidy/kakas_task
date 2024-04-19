import 'package:dartz/dartz.dart';

import '../../../../app/error/failures.dart';
import '../../../../app/usecase/usecase.dart';
import '../repo/account_repo.dart';

class AboutUseCase implements UseCase<String, NoParams> {
  final AccountRepo repository;

  AboutUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(NoParams params) async{
    return await repository.about();
  }
}

