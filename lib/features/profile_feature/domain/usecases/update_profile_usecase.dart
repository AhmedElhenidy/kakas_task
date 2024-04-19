import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../app/error/failures.dart';
import '../../../../../app/usecase/usecase.dart';
import '../../../auth_feature/data/model/user_model.dart';
import '../repo/account_repo.dart';

class UpdateProfileUseCase implements UseCase<UserModel, UpdateProfileUseCaseParams> {
  final AccountRepo repository;

  UpdateProfileUseCase({required this.repository});

  @override
  Future<Either<Failure, UserModel>> call(UpdateProfileUseCaseParams params) async{
    return await repository.updateProfile(params.toMap() as Map<String,String>,params.files());
  }
}

class UpdateProfileUseCaseParams {
  final String? name;
  final String? phone;
  final String? email;
  final File? image;
  UpdateProfileUseCaseParams(
      {
        this.name,
        this.phone,
        this.email,
        this.image,
      });

  Map<String, dynamic> toMap() {
    final map = {
      if(name!=null)"name": name!,
      if(phone!=null)"phone": phone!,
      if(email!=null)"email": email!,
    };
    return map;
  }

  Map<String, File> files() {
    final map = {
      if(image!=null)"image": image!,
    };
    return map;
  }
}
