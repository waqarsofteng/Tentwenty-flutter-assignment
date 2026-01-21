import 'package:flutter/material.dart';
import 'package:tentwenty_flutter_assignment/configs/route/routes/routes_name.dart';
import 'package:tentwenty_flutter_assignment/view/movie_booking_screen.dart';
import 'package:tentwenty_flutter_assignment/view/seat_selection_screen.dart';
import '../../../view/movie_detail_view.dart';
import '../../../view/movie_list_view.dart';
import '../../../view/movie_search_view.dart';
import '../../../view/nav_bar_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.movieListView:
        return MaterialPageRoute(
          builder: (BuildContext context) => WatchView(),
        );

      case RoutesName.movieSearchView:
        return MaterialPageRoute(
          builder: (BuildContext context) => MovieSearchView(),
        );

      case RoutesName.navBarView:
        return MaterialPageRoute(
          builder: (BuildContext context) => const NavBarView(),
        );

      case RoutesName.movieDetailView:
        final movieId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (BuildContext context) =>
              MovieDetailScreen(movieId: movieId),
        );

      case RoutesName.movieBookingScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => MovieBookingScreen(),
        );

      case RoutesName.seatSelectionScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => SeatSelectionScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) {
            return const Scaffold(
              body: Center(child: Text('No route defined')),
            );
          },
        );
    }
  }
}
