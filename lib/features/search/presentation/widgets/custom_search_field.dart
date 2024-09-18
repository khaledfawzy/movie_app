import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key, this.onSubmitted, this.onChanged});
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: textFieldBorder(),
        focusedBorder: textFieldBorder(),
        hintText: 'Search',
        prefixIcon: const Icon(Icons.search),
        fillColor: Colors.grey[800],
        filled: true,
      ),
      onChanged: onChanged,
      onSubmitted: onSubmitted,
    );
  }

  OutlineInputBorder textFieldBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: const BorderSide(
        color: AppColors.greyLightColor,
      ),
    );
  }
}
