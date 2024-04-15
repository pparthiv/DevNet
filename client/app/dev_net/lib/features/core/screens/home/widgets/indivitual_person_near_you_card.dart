import 'package:dev_net/features/core/screens/home/widgets/home_header.dart';
import 'package:dev_net/features/core/screens/home/widgets/home_search_bar.dart';
import 'package:dev_net/features/core/screens/user_view/user_view.dart';
import 'package:dev_net/utils/constants/colors.dart';
import 'package:dev_net/utils/constants/images_strings.dart';
import 'package:dev_net/utils/helpers/helper_function.dart';
import 'package:dev_net/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class IndivitualPersonNearYouCard extends StatelessWidget {
  const IndivitualPersonNearYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
          color: MyAppColors.primary,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 0.5, color: MyAppColors.darkerGrey)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image, Name, Domain, Forward Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Image, Name, Domain
              const Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(MyAppImages.userProfile),
                    maxRadius: 28,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Will Smith",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: MyAppColors.textWhite),
                      ),
                      Text(
                        "Web Developer",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: MyAppColors.textWhite),
                      )
                    ],
                  ),
                ],
              ),

              // Forward Button
              IconButton(
                onPressed: () => Get.to(() => UserView()),
                icon: const Icon(
                  Iconsax.tag_right,
                  color: MyAppColors.textWhite,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Divider(
              color: MyAppColors.textWhite.withOpacity(0.4), thickness: 1.2),

          // Person' s Description
          Text(
            "Anything considered to be a subject for analysis by or as if by methods of literary criticism. Digital Technology. a text message.",
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: MyAppColors.textWhite.withOpacity(0.8),
                wordSpacing: 0.2,
                height: 1.25),
          ),
          const SizedBox(
            height: 10,
          ),

          // Person's Skills
          Row(
            children: [
              Icon(
                Icons.people,
                color: MyAppColors.textWhite.withOpacity(0.7),
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                "Skills",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: MyAppColors.textWhite),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Wrap(
            spacing: 5,
            runSpacing: 5,
            children: [
              for (int i = 0; i < 5; i++) ...[
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                  decoration: BoxDecoration(
                      color: MyAppColors.textWhite.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(width: 0.4)),
                  child: const Text(
                    "Java Script",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 34, 122, 245)),
                  ),
                )
              ]
            ],
          )
        ],
      ),
    );
  }
}
