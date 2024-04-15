import 'package:dev_net/features/core/screens/home/widgets/home_header.dart';
import 'package:dev_net/features/core/screens/home/widgets/home_search_bar.dart';
import 'package:dev_net/utils/constants/colors.dart';
import 'package:dev_net/utils/constants/images_strings.dart';
import 'package:dev_net/utils/helpers/helper_function.dart';
import 'package:dev_net/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: email,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        fillColor: dark ? MyAppColors.darkishGrey : MyAppColors.textFieldLight,
        filled: true,
        prefixIcon: const Icon(
          Icons.search,
          color: MyAppColors.darkGrey,
        ),
        hintText: "Search People you know...",
        enabledBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(width: 1, color: MyAppColors.darkerGrey),
        ),
        focusedBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(width: 1, color: MyAppColors.darkGrey),
        ),
        // Set the hintStyle property to change the color of hint text
        hintStyle: const TextStyle(color: MyAppColors.darkGrey),
      ),
      validator: (value) {
        MyAppValidator.validateEmail(value);
        return null;
      },
    );
  }
}
