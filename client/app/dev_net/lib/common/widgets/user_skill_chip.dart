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
    this.isUserCardDesign = false,
  });

  final double horizontalSpacing;
  final double verticalSpacing;
  final double textSize;
  final bool isUserCardDesign;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalSpacing, vertical: verticalSpacing),
      decoration: isUserCardDesign
          ? BoxDecoration(
              color: MyAppColors.textWhite.withOpacity(0.8),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 0.4))
          : BoxDecoration(
              color: MyAppColors.primary,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 0.5, color: MyAppColors.darkerGrey)),
      child: Text(
        "Python",
        style: isUserCardDesign
            ? TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 34, 122, 245))
            : TextStyle(
                fontSize: textSize,
                fontWeight: FontWeight.w500,
                color: MyAppColors.textWhite),
      ),
    );
  }
}
