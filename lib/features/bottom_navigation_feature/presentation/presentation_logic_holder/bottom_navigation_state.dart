part of 'bottom_navigation_cubit.dart';

abstract class BottomNavigationState extends Equatable {
  const BottomNavigationState();
}

class BottomNavigationInitial extends BottomNavigationState {
  @override
  List<Object> get props => [];
}

class BottomNavigationOnReceivedNotification extends BottomNavigationState {
  final int count;
  const BottomNavigationOnReceivedNotification(this.count);
  @override
  List<Object> get props => [count];
}