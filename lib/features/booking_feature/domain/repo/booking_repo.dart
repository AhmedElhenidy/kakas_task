
import 'package:dartz/dartz.dart';
import '../../../../app/error/failures.dart';
import '../../data/model/barber_model.dart';
import '../../data/model/product_model.dart';
import '../../data/model/time_model.dart';

abstract  class BookingRepo{
  Future<Either<Failure, List<ProductModel>>>getHomeData();
  Future<Either<Failure, List<BarberModel>>>getBarbers();
  Future<Either<Failure, List<TimeModel>>>getTimes(Map<String,String> map);
  Future<Either<Failure, ProductModel>>addProduct(Map<String,dynamic> map);
}