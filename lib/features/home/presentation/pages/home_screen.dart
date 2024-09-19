import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/home/presentation/manager/new_release_cubit/new_release_cubit.dart';
import 'package:movie_app/features/home/presentation/manager/popular_cubit/popular_cubit.dart';
import 'package:movie_app/features/home/presentation/manager/recomended_cubit/recommended_cubit.dart';

import '../widgets/new_releases_section.dart';
import '../widgets/popular_movie_carousel_slider.dart';
import '../widgets/recomend_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async{
            BlocProvider.of<PopularCubit>(context).fetchPopularMovies();
            BlocProvider.of<RecommendedCubit>(context).fetchRecommendedMovies();
            BlocProvider.of<NewReleaseCubit>(context).fetchNewReleaseMovies();
          },
        child: SingleChildScrollView(
          child: Column(
            children: [
              const PopularMovieCarouselSlider(),
              SizedBox(
                height: 53.h,
              ),
              const NewReleasesSection(),
              SizedBox(
                height: 10.h,
              ),
              const RecommendedMoviesSection(),
            ],
          ),
        ),
      ),
    );
  }
}
