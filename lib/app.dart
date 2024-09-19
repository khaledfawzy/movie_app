import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/services/network/api_services.dart';
import 'package:movie_app/core/utils/setup_serv_locator.dart';
import 'package:movie_app/features/home/data/repos/home_repo.dart';
import 'package:movie_app/features/home/presentation/manager/new_release_cubit/new_release_cubit.dart';
import 'package:movie_app/features/home/presentation/manager/popular_cubit/popular_cubit.dart';
import 'package:movie_app/features/home/presentation/manager/recomended_cubit/recommended_cubit.dart';
import 'package:movie_app/features/search/data/repos/search_repo.dart';
import 'package:movie_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:movie_app/features/watchlist/presentation/manager/watch_list_cubit/watch_list_cubit.dart';

import 'core/utils/app_theme.dart';
import 'features/splash_Screen/splash_screen.dart';

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
              create: (context) => WatchListCubit()..fetchMoviesFromWatchList(),
            ),
            BlocProvider(
              create: (context) => PopularCubit(
                HomeRepoImpl(
                  getIt<ApiServices>(),
                ),
              )..fetchPopularMovies(),
            ),
            BlocProvider(
              create: (context) => NewReleaseCubit(
                HomeRepoImpl(getIt<ApiServices>()),
              )..fetchNewReleaseMovies(),
            ),
            BlocProvider(
              create: (context) => RecommendedCubit(
                HomeRepoImpl(getIt<ApiServices>()),
              )..fetchRecommendedMovies(),
            ),
            BlocProvider(
              create: (context) => SearchCubit(
                SearchRepoImpl(getIt<ApiServices>()),
              ),
            )
          ],
          child: MaterialApp(
            theme: AppTheme.mainTheme, // Apply dark theme
            debugShowCheckedModeBanner: false,
            title: 'Movies',

            home: const SplashScreen(),
          ),
        ));
  }
}
