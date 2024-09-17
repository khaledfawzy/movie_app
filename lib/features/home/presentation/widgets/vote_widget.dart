import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';

class VoteWidget extends StatelessWidget {
  const VoteWidget({super.key, required this.movie});
  final MovieModel movie;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.yellow,
          size: 15,
        ),
        Text(
          movie.voteAverage!.toStringAsFixed(1),
          style: AppStyles.textStyle12,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
      ],
    );
  }
}
