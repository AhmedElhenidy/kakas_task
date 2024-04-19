import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../../../app/error/failures.dart';
import '../../../auth_feature/data/model/user_model.dart';

abstract  class AccountRepo{
  Future<Either<Failure, UserModel>>getProfile();
  Future<Either<Failure, String>>deleteAccount();
  Future<Either<Failure, UserModel>>updateProfile(Map<String,String> map,Map<String, File> files);
  Future<Either<Failure, String>>contactUs(Map<String,String> map);
  Future<Either<Failure, String>>updatePassword(Map<String,String> map);
  Future<Either<Failure, String>>about();
  Future<Either<Failure, String>>terms();
}