import 'package:equatable/equatable.dart';

class MovieBookingState extends Equatable {
  final int selectedDateIndex;
  final int selectedShowIndex;

  const MovieBookingState({
    this.selectedDateIndex = 0,
    this.selectedShowIndex = 0,
  });

  MovieBookingState copyWith({
    int? selectedDateIndex,
    int? selectedShowIndex,
  }) {
    return MovieBookingState(
      selectedDateIndex: selectedDateIndex ?? this.selectedDateIndex,
      selectedShowIndex: selectedShowIndex ?? this.selectedShowIndex,
    );
  }

  @override
  List<Object?> get props => [selectedDateIndex, selectedShowIndex];
}