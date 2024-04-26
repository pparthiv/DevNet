import 'package:dev_net/utils/constants/colors.dart';
import 'package:dev_net/utils/constants/images_strings.dart';
import 'package:flutter/material.dart';

class ProfileImagewithNameAndExtraField extends StatelessWidget {
  const ProfileImagewithNameAndExtraField({
    super.key,
    this.fieldValue = "App Developer",
  });

  final String fieldValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Person's Image
        Center(
          child: CircleAvatar(
            backgroundImage: AssetImage(MyAppImages.userProfile),
            maxRadius: 50,
          ),
        ),
        SizedBox(
          height: 12,
        ),

        // Person's Name
        Center(
          child: Text(
            "Krishnabh Das",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: MyAppColors.textWhite),
          ),
        ),

        // Person's Domain
        Center(
          child: Text(
            fieldValue,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: MyAppColors.textWhite.withOpacity(0.7)),
          ),
        ),
      ],
    );
  }
}
