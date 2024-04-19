import 'package:dartz/dartz.dart';

import '../../../../../app/error/failures.dart';
import '../../../../../app/usecase/usecase.dart';
import '../../../data/model/product_model.dart';
import '../../repo/booking_repo.dart';

class GetHomeUseCase implements UseCase<List<ProductModel>, NoParams> {
  final BookingRepo repository;

  GetHomeUseCase({required this.repository});

  @override
  Future<Either<Failure, List<ProductModel>>> call(NoParams params) async{
    return await repository.getHomeData();
  }
}
