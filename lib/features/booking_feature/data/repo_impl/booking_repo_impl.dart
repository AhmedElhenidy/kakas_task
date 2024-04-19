

import 'package:dartz/dartz.dart';
import '../../../../app/error/failures.dart';
import '../../../../app/network/network_info.dart';
import '../../../../app/utils/hanlders/repo_impl_callhandler.dart';
import '../../domain/repo/booking_repo.dart';
import '../data_source/booking_remote_data_source.dart';
import '../model/barber_model.dart';
import '../model/product_model.dart';
import '../model/time_model.dart';

class BookingRepoImpl extends BookingRepo{
  final BookingRemoteDataSource bookingRemoteDataSource;
  final NetworkInfo networkInfo;
  BookingRepoImpl({required this.bookingRemoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<ProductModel>>> getHomeData() async{
    return await RepoImplCallHandler<List<ProductModel>>(networkInfo)(() async {
      return await bookingRemoteDataSource.getHomeData();
    });
  }

  @override
  Future<Either<Failure, List<BarberModel>>> getBarbers() async{
    return await RepoImplCallHandler<List<BarberModel>>(networkInfo)(() async {
      return await bookingRemoteDataSource.getBarbers();
    });
  }

  @override
  Future<Either<Failure, List<TimeModel>>> getTimes(Map<String, String> map) async{
    return await RepoImplCallHandler<List<TimeModel>>(networkInfo)(() async {
      return await bookingRemoteDataSource.getTimes(map);
    });
  }

  @override
  Future<Either<Failure, ProductModel>> addProduct(Map<String, dynamic> map) async{
    return await RepoImplCallHandler<ProductModel>(networkInfo)(() async {
      return await bookingRemoteDataSource.addProduct(map);
    });
  }

}