import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/movie_details/presentation/pages/movie_details_screen.dart';
import 'package:movie_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:movie_app/features/search/presentation/widgets/custom_search_field.dart';
import 'package:movie_app/features/search/presentation/widgets/search_result_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            children: [
              CustomSearchField(
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    BlocProvider.of<SearchCubit>(context).searchMovies(value);
                  }
                },
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    BlocProvider.of<SearchCubit>(context).searchMovies(value);
                  }
                },
              ),
              const SizedBox(height: 22),
              // Add your movie list or search results here

              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchResultsState) {
                    return Expanded(
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemCount: state.searchResultList.length,
                        separatorBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Divider(
                            color: Colors.grey[800],
                          ),
                        ),
                        // Replace this with your own movie item widget
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MovieDetailsScreen(
                                  movieId: state.searchResultList[index].id!,
                                ),
                              ),
                            );
                          },
                          child: SearchResultItem(
                            movieModel: state.searchResultList[index],
                          ),
                        ),
                      ),
                    );
                  } else if (state is SearchFailureState) {
                    return Center(
                      child: Text(state.errorMessage),
                    );
                  } else if (state is SearchLoadingState) {
                    return Expanded(
                      child: Skeletonizer(
                        child: ListView.separated(
                          itemCount: movies.length,
                          separatorBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Divider(
                              color: Colors.grey[800],
                            ),
                          ),
                          // Replace this with your own movie item widget
                          itemBuilder: (context, index) => SearchResultItem(
                            movieModel: movies[index],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Expanded(
                      child: Column(
                        children: [
                          const Spacer(),
                          Image.asset('$baseAssetImageUrl/no_movies.png'),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text("No movies found"),
                          const Spacer(),
                        ],
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      );
    });
  }
}
