import 'package:dev_net/features/core/screens/home/widgets/home_header.dart';
import 'package:dev_net/features/core/screens/home/widgets/home_search_bar.dart';
import 'package:dev_net/utils/constants/colors.dart';
import 'package:dev_net/utils/constants/images_strings.dart';
import 'package:dev_net/utils/helpers/helper_function.dart';
import 'package:dev_net/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UserSkillChips extends StatelessWidget {
  const UserSkillChips({
    super.key,
    this.horizontalSpacing = 16,
    this.verticalSpacing = 7,
    this.textSize = 14,
  });

  final double horizontalSpacing;
  final double verticalSpacing;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalSpacing, vertical: verticalSpacing),
      decoration: BoxDecoration(
          color: MyAppColors.primary,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 0.5, color: MyAppColors.darkerGrey)),
      child: Text(
        "Python",
        style: TextStyle(
            fontSize: textSize,
            fontWeight: FontWeight.w500,
            color: MyAppColors.textWhite),
      ),
    );
  }
}
