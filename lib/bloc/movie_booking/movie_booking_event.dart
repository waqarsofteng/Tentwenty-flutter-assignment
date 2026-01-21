import 'package:equatable/equatable.dart';

abstract class MovieBookingEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SelectDateEvent extends MovieBookingEvent {
  final int index;
  SelectDateEvent(this.index);

  @override
  List<Object?> get props => [index];
}

class SelectShowEvent extends MovieBookingEvent {
  final int index;
  SelectShowEvent(this.index);

  @override
  List<Object?> get props => [index];
}