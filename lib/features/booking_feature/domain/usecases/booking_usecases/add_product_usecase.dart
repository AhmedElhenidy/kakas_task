import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../app/error/failures.dart';
import '../../../../../app/usecase/usecase.dart';
import '../../../data/model/product_model.dart';
import '../../repo/booking_repo.dart';

class AddProductUseCase implements UseCase<ProductModel, AddProductUseCaseParams> {
  final BookingRepo repository;

  AddProductUseCase({required this.repository});

  @override
  Future<Either<Failure, ProductModel>> call(AddProductUseCaseParams params) async{
    return await repository.addProduct(params.toMap());
  }
}

class AddProductUseCaseParams {
  final String title;
  final num price;
  File image;

  AddProductUseCaseParams(
      {
        required this.title,
        required this.price,
        required this.image,
      });

  Map<String, dynamic> toMap() {
    final map = {
      "title": title,
      "price": price,
      "image":base64Encode(image.readAsBytesSync())
    };
    return map;
  }

}