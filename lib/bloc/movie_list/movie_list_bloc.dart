import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repos/movies_repository.dart';
import 'movie_list_event.dart';
import 'movie_list_state.dart';

class MovieListBloc extends Bloc<WatchEvent, WatchState> {
  final MovieRepository _movieRepository;

  MovieListBloc(this._movieRepository) : super(WatchLoading()) {
    on<FetchUpcomingMovies>((event, emit) async {
      try {
        emit(WatchLoading());

        // Attempt to fetch upcoming movies
        final movies = await _movieRepository.getUpcomingMovies();
        emit(WatchLoaded(movies));
      } catch (_) {
        // If fetching upcoming movies fails, show an error
        if (kDebugMode) {
          print('Error fetching upcoming movies');
        }
        emit(WatchError('Failed to load movies. Please check your internet connection.'));
      }
    });

    on<SearchMovies>((event, emit) async {
      try {
        emit(WatchLoading());

        // Attempt to search for movies based on the query
        final movies = await _movieRepository.searchMovies(event.query);
        emit(WatchLoaded(movies));
      } catch (e) {
        // If searching fails, show an error
        emit(WatchError('Error searching movies: $e'));
      }
    });
  }
}
