part of 'booking_cubit.dart';

abstract class BookingState extends Equatable {
  const BookingState();
}

class BookingInitial extends BookingState {
  @override
  List<Object> get props => [];
}

class GetHomeDataLoading extends BookingState {
  @override
  List<Object?> get props => [];
}
class GetBarbersLoading extends BookingState {
  @override
  List<Object?> get props => [];
}
class GetBarberTimesLoading extends BookingState {
  @override
  List<Object?> get props => [];
}
class AddProductLoading extends BookingState {
  @override
  List<Object?> get props => [];
}