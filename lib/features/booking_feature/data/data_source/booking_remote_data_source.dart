import 'dart:io';

import '../../../../app/network/network_manager.dart';
import '../../../../app/utils/hanlders/remote_data_source_handler.dart';
import '../model/barber_model.dart';
import '../model/product_model.dart';
import '../model/time_model.dart';


abstract class BookingRemoteDataSource {
  /// Calls the [GET] {home} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<ProductModel>> getHomeData();

  /// Calls the [GET] {barber/1} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<BarberModel>> getBarbers();

  /// Calls the [POST] {getTimes} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<TimeModel>> getTimes(Map<String,String> map);

  /// Calls the [POST] {/products} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<ProductModel> addProduct(Map<String,dynamic> map);

}

class BookRemoteDataSourceImpl implements BookingRemoteDataSource {
  final NetworkManager networkManager;

  BookRemoteDataSourceImpl({required this.networkManager});

  @override
  Future<List<ProductModel>> getHomeData() async {
    final res = await networkManager.request(
      method: RequestMethod.get,
      endPoint: "products",
    );
    final data =  await RemoteDataSourceCallHandler()(res);
    return (data as List).map((e) => ProductModel.fromJson(e)).toList();
  }

  @override
  Future<List<BarberModel>> getBarbers() async {
    final res = await networkManager.requestWithFormData(
      method: RequestMethod.get,
      endPoint: "barber",
    );
    final data =  await RemoteDataSourceCallHandler().handleFormData(res);
    return ((data.data??[]) as List).map((e) => BarberModel.fromJson(e)).toList();
  }

  @override
  Future<List<TimeModel>> getTimes(Map<String,String> map) async {
    final res = await networkManager.requestWithFormData(
      body: map,
      endPoint: "check-date",
    );
    final data =  await RemoteDataSourceCallHandler().handleFormData(res);
    return ((data.data??[]) as List).map((e) => TimeModel.fromJson(e)).toList();
  }

  @override
  Future<ProductModel> addProduct(Map<String,dynamic> map) async {
    final res = await networkManager.request(
      method: RequestMethod.post,
      body: map,
      endPoint: "products",
    );
    final data =  await RemoteDataSourceCallHandler()(res);
    return ProductModel.fromJson(data);
  }
}
