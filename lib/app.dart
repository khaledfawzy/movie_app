import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/watchlist/presentation/manager/watch_list_cubit/watch_list_cubit.dart';
import 'package:movie_app/features/layout/home_layout.dart';
import 'core/utils/app_theme.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => WatchListCubit()
              ..fetchMoviesFromWatchList(),
            ),
          ],
          child: MaterialApp(
            theme: AppTheme.mainTheme, // Apply dark theme
            debugShowCheckedModeBanner: false,
            title: 'Movies',

            home: const HomeLayout(),
          ),
        ));
  }
}
