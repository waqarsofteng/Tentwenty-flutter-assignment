import 'package:flutter_bloc/flutter_bloc.dart';
import 'seat_event.dart';
import 'seat_state.dart';
//
// class SeatBloc extends Bloc<SeatEvent, SeatState> {
//   SeatBloc() : super(const SeatState()) {
//     on<SeatSelectedEvent>((event, emit) {
//       emit(state.copyWith(
//         selectedRow: event.selectedRow,
//         selectedSeat: event.selectedSeat,
//         totalPrice: event.totalPrice,
//       ));
//     });
//   }
// }
class SeatBloc extends Bloc<SeatEvent, SeatState> {
  SeatBloc() : super(const SeatState()) {
    on<SeatSelectedEvent>((event, emit) {
      emit(state.copyWith(
        selectedRow: event.selectedRow,
        selectedSeat: event.selectedSeat,
        totalPrice: event.totalPrice,
      ));
    });

    on<ZoomInEvent>((event, emit) {
      double newScale = state.scale + 0.2;
      if (newScale > 2.0) newScale = 2.0;
      emit(state.copyWith(scale: newScale));
    });

    on<ZoomOutEvent>((event, emit) {
      double newScale = state.scale - 0.2;
      if (newScale < 0.6) newScale = 0.6;
      emit(state.copyWith(scale: newScale));
    });

    on<ResetZoomEvent>((event, emit) {
      emit(state.copyWith(scale: 1.0));
    });
  }
}