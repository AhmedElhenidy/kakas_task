import 'package:dartz/dartz.dart';

import '../../../../../app/error/failures.dart';
import '../../../../../app/usecase/usecase.dart';
import '../../../data/model/time_model.dart';
import '../../repo/booking_repo.dart';

class GetBarberTimesUseCase implements UseCase<List<TimeModel>, GetBarberTimesUseCaseParams> {
  final BookingRepo repository;

  GetBarberTimesUseCase({required this.repository});

  @override
  Future<Either<Failure, List<TimeModel>>> call(GetBarberTimesUseCaseParams params) async{
    return await repository.getTimes(params.toMap());
  }
}

class GetBarberTimesUseCaseParams {
  final String order_date;
  final String barber_id;

  GetBarberTimesUseCaseParams(
      {
        required this.order_date,
        required this.barber_id,
      });

  Map<String, String> toMap() {
    final map = {
      "order_date": order_date,
      "barber_id": barber_id,
    };
    return map;
  }
}