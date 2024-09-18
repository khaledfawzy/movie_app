import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/services/network/api_services.dart';
import 'package:movie_app/core/utils/setup_serv_locator.dart';
import 'package:movie_app/features/movie_details/data/repos/details_repo.dart';
import 'package:movie_app/features/movie_details/presentation/manager/details_cubit/details_cubit.dart';
import 'package:movie_app/features/movie_details/presentation/widgets/movie_details_body.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../home/data/models/movie_model.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key, required this.movieId});
  final int movieId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsCubit(
        DetailsRepoImpl(getIt<ApiServices>()),
      )..fetchMovieDetails(movieId),
      child: Scaffold(
        body: BlocBuilder<DetailsCubit, DetailsState>(
          builder: (context, state) {
            if (state is DetailsSuccessState) {
              return MovieDetailsBody(
                movieModel: state.movieDetails,
              );
            } else if (state is DetailsFailureState) {
              return Center(
                child: Text(state.errorMessage),
              );
            } else {
              return Skeletonizer(
                  child: MovieDetailsBody(
                movieModel: movies[0],
              ));
              // return const Center(
              //   child: CircularProgressIndicator(),
              // );
            }
          },
        ),
      ),
    );
  }
}
