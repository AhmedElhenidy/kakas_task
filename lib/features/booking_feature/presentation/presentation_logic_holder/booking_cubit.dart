
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/usecase/usecase.dart';
import '../../../../app/utils/get_it_injection.dart';
import '../../../../app/utils/hanlders/error_state_handler.dart';
import '../../../../app/utils/navigation_helper.dart';
import '../../data/model/barber_model.dart';
import '../../data/model/product_model.dart';
import '../../data/model/time_model.dart';
import '../../domain/usecases/booking_usecases/add_product_usecase.dart';
import '../../domain/usecases/booking_usecases/get_home_usecase.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingInitial());
  static BookingCubit get() => BlocProvider.of(getIt<NavHelper>().navigatorKey.currentState!.context);
  List<ProductModel> products=[];
  List<BarberModel> barbers=[];
  List<num> selectedServicesIds=[];
  List<TimeModel> barberTimes=[];
  num totalValue = 0;

  void getHomeProducts() async {
    totalValue=0;
    emit(GetHomeDataLoading());
    final response = await getIt<GetHomeUseCase>()(NoParams());
    response.fold(
      errorStateHandler,
          (r) {
            products=r;
            },
    );
    emit(BookingInitial());
  }

  void addProduct(String title,num price,File image) async {
    emit(AddProductLoading());
    final response = await getIt<AddProductUseCase>()(AddProductUseCaseParams(
      title: title,
      price: price,
      image: image,
    ));
    response.fold(
      errorStateHandler,
          (r) {
            products.add(r);
      },
    );
    emit(BookingInitial());
  }

}
