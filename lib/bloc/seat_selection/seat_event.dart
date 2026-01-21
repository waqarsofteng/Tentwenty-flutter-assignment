import 'package:equatable/equatable.dart';

abstract class SeatEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SeatSelectedEvent extends SeatEvent {
  final String selectedRow;
  final String selectedSeat;
  final double totalPrice;

  SeatSelectedEvent({
    required this.selectedRow,
    required this.selectedSeat,
    required this.totalPrice,
  });

  @override
  List<Object> get props => [selectedRow, selectedSeat, totalPrice];
}

class ZoomInEvent extends SeatEvent {}
class ZoomOutEvent extends SeatEvent {}
class ResetZoomEvent extends SeatEvent {}