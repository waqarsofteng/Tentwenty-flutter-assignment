import 'package:flutter_bloc/flutter_bloc.dart';
import 'movie_booking_event.dart';
import 'movie_booking_state.dart';

class MovieBookingBloc extends Bloc<MovieBookingEvent, MovieBookingState> {
  MovieBookingBloc() : super(const MovieBookingState()) {
    on<SelectDateEvent>((event, emit) {
      emit(state.copyWith(selectedDateIndex: event.index));
    });

    on<SelectShowEvent>((event, emit) {
      emit(state.copyWith(selectedShowIndex: event.index));
    });
  }
}