import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tentwenty_flutter_assignment/repos/movies_repository.dart';
import 'bloc/movie_booking/movie_booking_bloc.dart';
import 'bloc/movie_list/movie_list_bloc.dart';
import 'bloc/search/search_bloc.dart';
import 'bloc/seat_selection/seat_bloc.dart';
import 'configs/route/routes/routes.dart';
import 'configs/route/routes/routes_name.dart';


void main() {
  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SearchBarBloc()),
          BlocProvider(create: (context) => MovieListBloc(MovieRepository())),
          BlocProvider(create: (context) => MovieBookingBloc()),
          BlocProvider(create: (context) => SeatBloc()),
        ],
        child: const MyApp(),
      )
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'TenTwenty',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            fontFamily: 'Poppins',
            textTheme: TextTheme(
              displayLarge: const TextStyle(fontWeight: FontWeight.w500),
              displayMedium: const TextStyle(fontWeight: FontWeight.w500),
              displaySmall: const TextStyle(fontWeight: FontWeight.w500),
              headlineLarge: const TextStyle(fontWeight: FontWeight.w500),
              headlineMedium: const TextStyle(fontWeight: FontWeight.w500),
              headlineSmall: const TextStyle(fontWeight: FontWeight.w500),
              titleLarge: const TextStyle(fontWeight: FontWeight.w500),
              titleMedium: const TextStyle(fontWeight: FontWeight.w500),
              titleSmall: const TextStyle(fontWeight: FontWeight.w500),
              bodyLarge: const TextStyle(fontWeight: FontWeight.w500),
              bodyMedium: const TextStyle(fontWeight: FontWeight.w500),
              bodySmall: const TextStyle(fontWeight: FontWeight.w500),
              labelLarge: const TextStyle(fontWeight: FontWeight.w500),
              labelMedium: const TextStyle(fontWeight: FontWeight.w500),
              labelSmall: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          initialRoute: RoutesName.navBarView,
          onGenerateRoute: Routes.generateRoute,
        );
      },
    );
  }
}