import 'package:dartz/dartz.dart';

import '../../../../../app/error/failures.dart';
import '../../../../../app/usecase/usecase.dart';
import '../../../data/model/barber_model.dart';
import '../../repo/booking_repo.dart';

class GetBarbersUseCase implements UseCase<List<BarberModel>, NoParams> {
  final BookingRepo repository;

  GetBarbersUseCase({required this.repository});

  @override
  Future<Either<Failure, List<BarberModel>>> call(NoParams params) async{
    return await repository.getBarbers();
  }
}
