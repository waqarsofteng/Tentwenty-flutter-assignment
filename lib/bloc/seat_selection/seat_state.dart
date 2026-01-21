import 'package:equatable/equatable.dart';

class SeatState extends Equatable {
  final String selectedRow;
  final String selectedSeat;
  final double totalPrice;
  final double scale;

  const SeatState({
    this.selectedRow = '',
    this.selectedSeat = '',
    this.totalPrice = 0,
    this.scale = 1.0,
  });

  SeatState copyWith({
    String? selectedRow,
    String? selectedSeat,
    double? totalPrice,
    double? scale,
  }) {
    return SeatState(
      selectedRow: selectedRow ?? this.selectedRow,
      selectedSeat: selectedSeat ?? this.selectedSeat,
      totalPrice: totalPrice ?? this.totalPrice,
      scale: scale ?? this.scale,
    );
  }

  @override
  List<Object> get props => [selectedRow, selectedSeat, totalPrice, scale];
}