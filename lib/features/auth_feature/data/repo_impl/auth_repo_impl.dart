import 'dart:convert';
import 'package:dartz/dartz.dart';
import '../../../../app/error/failures.dart';
import '../../../../app/network/network_info.dart';
import '../../../../app/services/cache_service.dart';
import '../../../../app/utils/get_it_injection.dart';
import '../../../../app/utils/hanlders/repo_impl_callhandler.dart';
import '../../domain/repo/auth_repo.dart';
import '../data_source/auth_remote_data_source.dart';
import '../model/user_model.dart';

class AuthRepoImpl extends AuthRepo{
  final AuthRemoteDataSource authRemoteDataSource;
  final NetworkInfo networkInfo;
  AuthRepoImpl({required this.authRemoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, UserModel>> signIn(Map<String,String> map)async {
    return await RepoImplCallHandler<UserModel>(networkInfo)(() async {
      final result= await authRemoteDataSource.signIn(map);
      await getIt<CacheService>().setUserToken(token: result.token??"null");
      final user = await authRemoteDataSource.validate();
      await getIt<CacheService>().saveUserData(encodedUser: json.encode(user.toJson()));
      return  result;
    });
  }
  @override
  Future<Either<Failure, UserModel>> signUp(Map<String,String> map)async {
    return await RepoImplCallHandler<UserModel>(networkInfo)(() async {
      final result= await authRemoteDataSource.signUp(map);
      await getIt<CacheService>().setUserToken(token: result.token??"null");
      final user = await authRemoteDataSource.validate();
      await getIt<CacheService>().saveUserData(encodedUser: json.encode(user.toJson()));
      return  result;
    });
  }

}