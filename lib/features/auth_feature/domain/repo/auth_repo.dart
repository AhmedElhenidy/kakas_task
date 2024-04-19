import 'package:dartz/dartz.dart';
import '../../../../app/error/failures.dart';
import '../../data/model/user_model.dart';

abstract  class AuthRepo{
  Future<Either<Failure, UserModel>>signIn(Map<String,String> map);
  Future<Either<Failure, UserModel>>signUp(Map<String,String> map);
}