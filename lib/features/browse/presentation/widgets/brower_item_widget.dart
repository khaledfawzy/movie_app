import 'package:flutter/material.dart';

import '../../data/models/general_model.dart';

class BrowseItemWidget extends StatelessWidget {
 final GeneralModel genres;
  const BrowseItemWidget({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 100,
      decoration:   BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        image: DecorationImage(
          image: AssetImage('assets/images/${ genres.name}.jpeg'),
          // Replace with your image path
          fit: BoxFit.cover,
        ),
      ),
      child:   Center(
        child: Text(
          genres.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
