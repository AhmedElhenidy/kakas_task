
import 'dart:io';

import '../../../../app/network/network_manager.dart';
import '../../../../app/utils/consts.dart';
import '../../../../app/utils/hanlders/remote_data_source_handler.dart';
import '../../../auth_feature/data/model/user_model.dart';

abstract class AccountRemoteDataSource {
  /// Calls the [Get] {profile} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<UserModel> getProfile();

   /// Calls the [POST] {update-profile} endpoint.
   ///
   /// Throws a [ServerException] for all error codes.
   Future<UserModel> updateProfile(Map<String, String> map,Map<String, File>? files);

   /// Calls the [POST] {contact-us} endpoint.
   ///
   /// Throws a [ServerException] for all error codes.
   Future<String> contactUs(Map<String, String> map);

  /// Calls the [PATCH] {update-passward} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<String> changePassword(Map<String, String> map);

  /// Calls the [DELETE] {delete-account} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<String> deleteAccount();

  /// Calls the [GET] {/about} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<String> about();

  /// Calls the [GET] {/terms} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<String> terms();

}

class AccountRemoteDataSourceImpl implements AccountRemoteDataSource {
  final NetworkManager networkManager;

  AccountRemoteDataSourceImpl({required this.networkManager});

  @override
  Future<UserModel> getProfile() async {
    final res = await networkManager.requestWithFormData(
      endPoint: kProfile,
      method: RequestMethod.get,
    );
    final data =  await RemoteDataSourceCallHandler().handleFormData(res);
    return UserModel.fromMap(data.data);
  }

  @override
  Future<UserModel> updateProfile(Map<String, String> map,Map<String, File>? files) async {
    var response;
    if(files?["image"]!=null){
      response = await networkManager.requestWithFile(
        endPoint: kUpdateProfile,
        body: map,
        files: files,
      );
    }else{
      response = await networkManager.requestWithFormData(
        endPoint: kUpdateProfile,
        method: RequestMethod.put,
        body: map,
      );
    }

    final data =  await RemoteDataSourceCallHandler().handleFormData(response);
    return UserModel.fromMap(data.data['user']);
  }

  @override
  Future<String> contactUs(Map<String, String> map) async {
    final res = await networkManager.requestWithFormData(
      endPoint: kContactUs,
      body: map,
    );
    final data =  await RemoteDataSourceCallHandler().handleFormData(res);
    return data.msg??"";
  }

  @override
  Future<String> changePassword(Map<String, String> map) async {
    final res = await networkManager.requestWithFormData(
        endPoint: kUpdatePassword,
        body: map,
        method: RequestMethod.patch
    );
    final data =  await RemoteDataSourceCallHandler().handleFormData(res);
    return data.msg??"";
  }

  @override
  Future<String> deleteAccount() async {
    final res = await networkManager.requestWithFormData(
        endPoint: kDeleteAccount,
        method: RequestMethod.delete
    );
    final data =  await RemoteDataSourceCallHandler().handleFormData(res);
    return data.msg??"";
  }

  @override
  Future<String> about() async {
    final res = await networkManager.requestWithFormData(
      endPoint: "kAbout",
      method: RequestMethod.get,
    );
    final data =  await RemoteDataSourceCallHandler().handleFormData(res);
    return data.data;
  }


  @override
  Future<String> terms() async {
    final res = await networkManager.requestWithFormData(
      endPoint: "kTerms",
      method: RequestMethod.get,
    );
    final data =  await RemoteDataSourceCallHandler().handleFormData(res);
    return data.data;
  }

}