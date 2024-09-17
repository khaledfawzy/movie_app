import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/services/network/api_services.dart';
import 'package:movie_app/core/utils/setup_serv_locator.dart';
import 'package:movie_app/features/home/data/repos/home_repo.dart';
import 'package:movie_app/features/home/presentation/manager/popular_cubit/popular_cubit.dart';
import 'package:movie_app/features/home/presentation/widgets/popular_movie_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../data/models/movie_model.dart';

class PopularMovieCarouselSlider extends StatelessWidget {
  const PopularMovieCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PopularCubit(
        HomeRepoImpl(
          getIt<ApiServices>(),
        ),
      )..fetchPopularMovies(),
      child: SizedBox(
        height: 170.h,
        child: BlocBuilder<PopularCubit, PopularState>(
          builder: (context, state) {
            if (state is PopularSuccessState) {
              return CarouselSlider.builder(
                itemCount: state.popularMoviesList.length,
                itemBuilder: (context, index, realIndex) {
                  return PopularMovieCarouselItem(
                      movie: state.popularMoviesList[index]);
                },
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  pageSnapping: false,
                  padEnds: false,
                  viewportFraction: 1,
                  // scrollPhysics: const NeverScrollableScrollPhysics(),
                  // enlargeFactor: 0.5,
                  clipBehavior: Clip.none,
                  height: 200.h,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  scrollDirection: Axis.horizontal,
                ),
              );
            } else if (state is PopularFailureState) {
              return Center(
                child: Text(state.errorMessage),
              );
            } else {
              return Skeletonizer(
                child: PopularMovieCarouselItem(movie: movies[1]),
              );
            }
          },
        ),
      ),
    );
  }
}