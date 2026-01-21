
import 'package:equatable/equatable.dart';

abstract class SearchBarEvent extends Equatable {
  const SearchBarEvent();

  @override
  List<Object> get props => [];
}

class ToggleSearch extends SearchBarEvent {}




// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:tentwenty_flutter_assignment/bloc/search/search_event.dart';
// import 'package:tentwenty_flutter_assignment/bloc/search/search_state.dart';
// class SearchBarBloc extends Bloc<SearchBarEvent, SearchBarState> {
//   SearchBarBloc() : super(const SearchBarState(isSearching: false)) {
//     on<ToggleSearch>((event, emit) {
//       emit(state.copyWith(isSearching: !state.isSearching));
//     });
//   }
// }
//
// class SearchBarBloc extends Bloc<SearchBarEvent, SearchBarState> {
//   SearchBarBloc() : super(const SearchBarState(isSearching: false, query: '')) {
//     on<SearchQueryChanged>((event, emit) {
//       emit(state.copyWith(isSearching: event.query.isNotEmpty, query: event.query));
//     });
//
//     on<ClearSearch>((event, emit) {
//       emit(state.copyWith(isSearching: false, query: ''));
//     });
//   }
// }