import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/services/network/api_services.dart';
import 'package:movie_app/core/utils/setup_serv_locator.dart';
import 'package:movie_app/features/browse/data/repos/browse_repo.dart';
import 'package:movie_app/features/browse/presentation/manager/genre_cubit/genre_cubit.dart';
import 'package:movie_app/features/browse/presentation/widgets/browse_result_item.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';

class BrowseResultScreen extends StatelessWidget {
  const BrowseResultScreen({super.key, required this.genreId});
  final int genreId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenreCubit(
        BrowseRepoImpl(getIt<ApiServices>()),
      )..fetchMoviesByGenre(genreId),
      child: Scaffold(
        body: Column(
          children: [
            const Text('Browse Result'),
            Expanded(
              child: BlocBuilder<GenreCubit, GenreState>(
                builder: (context, state) {
                  if (state is GenreSuccessState) {
                    return ListView.separated(
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: state.genreList.length,
                        itemBuilder: (context, index) {
                          return BrowseResultItem(
                            movieModel: state.genreList[index],
                          );
                        });
                  } else if (state is GenreFailureState) {
                    return Center(
                      child: Text(state.errorMessage),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: movies.length,
                      itemBuilder: (context, index) => BrowseResultItem(
                        movieModel: movies[index],
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
