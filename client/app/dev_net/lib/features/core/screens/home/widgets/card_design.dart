import 'package:dev_net/common/widgets/user_skill_chip.dart';
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

class CardDesign extends StatelessWidget {
  const CardDesign({
    super.key,
    this.isUser = true,
    required this.onTap,
  });

  final bool isUser; // as used for user and project
  final VoidCallback onTap;

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
              Row(
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
                      isUser
                          ? Text(
                              "Web Developer",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: MyAppColors.textWhite),
                            )
                          : SizedBox(),
                    ],
                  ),
                ],
              ),

              // Forward Button
              IconButton(
                onPressed: onTap,
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
            height: 16,
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
              Text(
                isUser ? "Skills" : "Tech Used",
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
                UserSkillChips(
                  horizontalSpacing: 8,
                  verticalSpacing: 7,
                  isUserCardDesign: true,
                )
              ]
            ],
          )
        ],
      ),
    );
  }
}
