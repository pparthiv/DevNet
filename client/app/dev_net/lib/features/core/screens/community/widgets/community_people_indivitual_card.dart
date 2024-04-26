import 'package:dev_net/features/core/screens/user_view/user_view.dart';
import 'package:dev_net/utils/constants/colors.dart';
import 'package:dev_net/utils/constants/images_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

class CommunityPeopleIndivitualCard extends StatelessWidget {
  const CommunityPeopleIndivitualCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
          color: MyAppColors.primary,
          border: Border.all(width: 1, color: MyAppColors.darkerGrey),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(MyAppImages.userProfile),
                maxRadius: 27,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tim Crook",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: MyAppColors.textWhite.withOpacity(0.9)),
                  ),
                  Text(
                    "Web Developer",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: MyAppColors.textWhite.withOpacity(0.7)),
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () => Get.to(() => const UserView()),
            icon: const Icon(
              Iconsax.tag_right,
              color: MyAppColors.textWhite,
            ),
          )
        ],
      ),
    );
  }
}
