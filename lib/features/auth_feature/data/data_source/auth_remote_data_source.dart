import '../../../../app/network/network_manager.dart';
import '../../../../app/utils/consts.dart';
import '../../../../app/utils/hanlders/remote_data_source_handler.dart';
import '../model/user_model.dart';


abstract class AuthRemoteDataSource {
  /// Calls the [POST] {auth/login} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
   Future<UserModel> signIn(Map<String, String> map);

   /// Calls the [POST] {auth/register} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
   Future<UserModel> signUp(Map<String, String> map);

   /// Calls the [POST] {auth/validate} endpoint.
   ///
   /// Throws a [ServerException] for all error codes.
   Future<UserModel> validate();

}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final NetworkManager networkManager;

  AuthRemoteDataSourceImpl({required this.networkManager});

  @override
  Future<UserModel> signIn(Map<String, dynamic> map) async {
    final res = await networkManager.request(
      method: RequestMethod.post,
      body: map,
      endPoint: kSignIn,
    );
    final data =  await RemoteDataSourceCallHandler()(res);
    return UserModel.fromMap(data);
  }

  @override
  Future<UserModel> signUp(Map<String, dynamic> map) async {
    final res = await networkManager.request(
      method: RequestMethod.post,
      body: map,
      endPoint: kSignUp,
    );
    final data =  await RemoteDataSourceCallHandler()(res);
    return UserModel.fromMap(data);
  }

  @override
  Future<UserModel> validate() async {
    final res = await networkManager.request(
      method: RequestMethod.get,
      endPoint: kValidate,
    );
    final data =  await RemoteDataSourceCallHandler()(res);
    return UserModel.fromMap(data);
  }
}